ActiveAdmin.register Application do
  menu parent: 'User Mangement', priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :gender, :birth_year, :street, :street2, :city, :state, :zip, :country, :phone, :email, :email_confirmation, :workshop_selection1, :workshop_selection2, :workshop_selection3, :lodging_selection, :partner_registration_selection, :partner_first_name, :partner_last_name, :how_did_you_hear, :accessibility_requirements, :special_lodging_request, :food_restrictions, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :gender, :birth_year, :street, :street2, :city, :state, :zip, :country, :phone, :email, :email_confirmation, :workshop_selection1, :workshop_selection2, :workshop_selection3, :lodging_selection, :partner_registration_selection, :partner_first_name, :partner_last_name, :how_did_you_hear, :accessibility_requirements, :special_lodging_request, :food_restrictions, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
