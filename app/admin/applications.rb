ActiveAdmin.register Application do
  menu parent: "User Mangement", priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :gender, :birth_year, :street, :street2, :city, :state, :zip, :country, :phone, :email, :email_confirmation, :workshop_selection1, :workshop_selection2, :workshop_selection3, :lodging_selection, :partner_registration_selection, :partner_first_name, :partner_last_name, :how_did_you_hear, :accessibility_requirements, :special_lodging_request, :food_restrictions, :user_id, :lottery_position, :offer_status, :result_email_sent, :offer_status_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :gender, :birth_year, :street, :street2, :city, :state, :zip, :country, :phone, :email, :email_confirmation, :workshop_selection1, :workshop_selection2, :workshop_selection3, :lodging_selection, :partner_registration_selection, :partner_first_name, :partner_last_name, :how_did_you_hear, :accessibility_requirements, :special_lodging_request, :food_restrictions, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  scope :active_conference_applications, :default => true, label: "Current years Applications"
  scope :all

  action_item :send_offer, only: :show do
    button_to "Send Offer", send_offer_path(application) if application.offer_status == "not_offered"
  end

  filter :user, as: :select, collection: -> { Application.all.map { |appl| [appl.display_name, appl.id]}.sort}
  filter :offer_status, as: :select
  filter :gender, as: :select, collection: -> { Gender.all.map{|a| [a.name, a.id]} }
  filter :workshop_selection1, label: "workshop_selection1", as: :select, collection: -> { Workshop.all.sort }
  filter :workshop_selection2, label: "workshop_selection2", as: :select, collection: -> { Workshop.all.sort }
  filter :workshop_selection3, label: "workshop_selection3", as: :select, collection: -> { Workshop.all.sort }
  filter :lodging_selection, as: :select, collection: -> { Lodging.all.sort }
  filter :country, as: :select

  index do
    selectable_column
    actions
    column :id do |id|
      link_to id.id, admin_application_path(id)
    end
    column :user
    column :lottery_position
    column :offer_status
    column :first_name
    column :last_name
    column "gender" do |sex|
      Gender.find(sex.gender).name
    end
    column "workshop_selection1" do |w1|
      Workshop.find(w1.workshop_selection1).instructor
    end
    column "workshop_selection2" do |w2|
      Workshop.find(w2.workshop_selection2).instructor
    end
    column "workshop_selection3" do |w3|
      Workshop.find(w3.workshop_selection3).instructor
    end
    column "lodging_selection" do |lodge|
      Lodging.find(lodge.lodging_selection).description
    end
    column "partner_registration_selection" do |partner|
      PartnerRegistration.find(partner.partner_registration_selection).description
    end
    column :birth_year
    column :street
    column :street2
    column :city
    column :state
    column :zip
    column :country
    column :phone
    column :email
    column :email_confirmation
    column :partner_first_name
    column :partner_last_name
    column :how_did_you_hear
    column :accessibility_requirements
    column :special_lodging_request
    column :food_restrictions

    column :result_email_sent
    column :offer_status_date
    column :conf_year
  end

  show do
    attributes_table do
      row :user
      row :lottery_position
      row :offer_status
      row :offer_status_date
      row :result_email_sent
      row :first_name
      row :last_name
      row "gender" do |sex|
        Gender.find(sex.gender).name
      end
      row :birth_year
      row :street
      row :street2
      row :city
      row :state
      row :zip
      row :country
      row :phone
      row :email
      row :email_confirmation
      row "workshop_selection1" do |w1|
        Workshop.find(w1.workshop_selection1).instructor
      end
      row "workshop_selection2" do |w2|
        Workshop.find(w2.workshop_selection2).instructor
      end
      row "workshop_selection3" do |w3|
        Workshop.find(w3.workshop_selection3).instructor
      end
      row "lodging_selection" do |lodge|
        Lodging.find(lodge.lodging_selection).description
      end
      row "partner_registration_selection" do |partner|
        PartnerRegistration.find(partner.partner_registration_selection).description
      end
      row :partner_first_name
      row :partner_last_name
      row :how_did_you_hear
      row :accessibility_requirements
      row :special_lodging_request
      row :food_restrictions
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :user
      f.input :lottery_position, input_html: { disabled: true }
      f.input :offer_status, :label => "Offer status", :as => :select, :collection => offer_status
      f.input :offer_status_date
      f.input :first_name
      f.input :last_name
      f.input :gender, :label => "Gender", :as => :select, :collection => Gender.all.map { |g| ["#{g.name}", g.id] }
      f.input :birth_year
      f.input :street
      f.input :street2
      f.input :city
      f.input :state, :label => "State", :as => :select, :collection => us_states
      f.input :zip
      f.input :country
      f.input :phone
      f.input :email
      f.input :workshop_selection1, :label => "Workshop First Choice", :as => :select, :collection => Workshop.all.map { |w| ["#{w.instructor}", w.id] }
      f.input :workshop_selection2, :label => "Workshop Second Choice", :as => :select, :collection => Workshop.all.map { |w| ["#{w.instructor}", w.id] }
      f.input :workshop_selection3, :label => "Workshop Third Choice", :as => :select, :collection => Workshop.all.map { |w| ["#{w.instructor}", w.id] }
      f.input :lodging_selection, :label => "Lodging selection", :as => :select, :collection => Lodging.all.map { |l| ["Plan:#{l.plan} #{l.description} #{number_to_currency(l.cost.to_f)}", l.id] }
      f.input :partner_registration_selection, :label => "Partner Registration Selection", :as => :select, :collection => PartnerRegistration.all.map { |p| ["#{p.description} #{number_to_currency(p.cost.to_f)}", p.id] }
      f.input :partner_first_name
      f.input :partner_last_name
      f.input :how_did_you_hear
      f.input :accessibility_requirements
      f.input :special_lodging_request
      f.input :food_restrictions
    end
    f.actions
  end
end
