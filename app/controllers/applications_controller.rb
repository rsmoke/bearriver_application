class ApplicationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :get_lodgings

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    # @workshops = @application.workshops
    @workshop1 = Workshop.find(@application.workshop_selection1).instructor
    @workshop2 = Workshop.find(@application.workshop_selection2).instructor
    @workshop3 = Workshop.find(@application.workshop_selection3).instructor
    @lodging = Lodging.find(@application.lodging_selection).description
    @partner_description = PartnerRegistration.find(@application.partner_registration_selection).description
    cost_lodging = Lodging.find(@application.lodging_selection).cost.to_f
    cost_partner = PartnerRegistration.find(@application.partner_registration_selection).cost.to_f
    @total_cost = cost_lodging + cost_partner
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    @application.email = current_user.email
    @application.user = current_user
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Confirm Your Application Details.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Application was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:first_name, :last_name, :gender, :birth_year, :street, :street2, :city, :state, :zip, :country, :phone, :email, :email_confirmation, :workshop_selection1, :workshop_selection2, :workshop_selection3, :lodging_selection, :partner_registration_selection, :partner_first_name, :partner_last_name, :how_did_you_hear, :accessibility_requirements, :special_lodging_request, :food_restrictions, :user_id)
    end

    def get_lodgings
      @lodgings = Lodging.all
    end
end
