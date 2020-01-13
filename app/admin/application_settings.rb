ActiveAdmin.register ApplicationSetting do
  menu parent: 'Application Configuration', priority: 1
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :opendate, :application_buffer, :contest_year, :time_zone, :allow_payments, :active_application
  #
  # or
  #
  # permit_params do
  #   permitted = [:opendate, :application_buffer, :contest_year, :time_zone, :allow_payments, :active_application]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
