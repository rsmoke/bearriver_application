class ApplicationSettingsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_application_setting, only: [:show, :edit, :update, :destroy]

  # GET /application_settings
  # GET /application_settings.json
  def index
    @application_settings = ApplicationSetting.all
  end

  # GET /application_settings/1
  # GET /application_settings/1.json
  def show
  end

  # GET /application_settings/new
  def new
    @application_setting = ApplicationSetting.new
  end

  # GET /application_settings/1/edit
  def edit
  end

  # POST /application_settings
  # POST /application_settings.json
  def create
    @application_setting = ApplicationSetting.new(application_setting_params)

    respond_to do |format|
      if @application_setting.save
        format.html { redirect_to @application_setting, notice: 'Application setting was successfully created.' }
        format.json { render :show, status: :created, location: @application_setting }
      else
        format.html { render :new }
        format.json { render json: @application_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_settings/1
  # PATCH/PUT /application_settings/1.json
  def update
    respond_to do |format|
      if @application_setting.update(application_setting_params)
        format.html { redirect_to application_settings_path, notice: 'Application setting was successfully updated.' }
        format.json { render :show, status: :ok, location: application_settings_path }
      else
        format.html { render :edit }
        format.json { render json: @application_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_settings/1
  # DELETE /application_settings/1.json
  def destroy
    @application_setting.destroy
    respond_to do |format|
      format.html { redirect_to application_settings_url, notice: 'Application setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def run_lottery
    if (current_application_settings.opendate + current_application_settings.application_open_period.hours) < Time.now
      if current_application_settings.lottery_result.nil?
        active_applications_ids = Application.active_conference_applications.pluck(:id)
        3.times { active_applications_ids.shuffle! }
        current_application_settings.update(lottery_result: active_applications_ids, lottery_run_date: Time.now)

        current_application_settings.lottery_result.each_with_index do |item, idx|
          app = Application.find(item)

          if idx < current_application_settings.lottery_buffer
            app.update(lottery_position: idx, offer_status: "registration_offered", offer_status_date: Time.now, result_email_sent: true)
            LotteryMailer.with(application: app).won_lottery_email.deliver_now
          else 
            app.update(lottery_position: idx, offer_status: "not_offered", offer_status_date: Time.now, result_email_sent: true)
            LotteryMailer.with(application: app).lost_lottery_email.deliver_now
          end
        end
        redirect_to admin_root_path, notice: 'The lottery was successfully run.'
      else
        redirect_to admin_root_path, alert: 'The lottery has already been run'
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_setting
      @application_setting = ApplicationSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_setting_params
      params.require(:application_setting).permit(:opendate, :application_buffer, :contest_year, :time_zone)
    end
end
