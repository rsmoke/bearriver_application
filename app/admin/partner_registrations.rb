ActiveAdmin.register PartnerRegistration do
  menu parent: 'Application Configuration', priority: 3
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :description, :cost
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :cost]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
