ActiveAdmin.register Lodging do
  menu parent: 'Application Configuration', priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :plan, :description, :cost
  #
  # or
  #
  # permit_params do
  #   permitted = [:plan, :description, :cost]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
