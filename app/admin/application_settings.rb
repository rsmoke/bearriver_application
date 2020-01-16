ActiveAdmin.register ApplicationSetting do
  menu parent: 'Application Configuration', priority: 1

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :opendate, :application_buffer, :contest_year, :time_zone, :allow_payments, :active_application, :allow_lottery_winner_emails, :allow_lottery_loser_emails, :registration_fee, :lottery_buffer, :application_open_directions, :application_closed_directions, :application_open_period
  #
  # or
  #
  # permit_params do
  #   permitted = [:opendate, :application_buffer, :contest_year, :time_zone, :allow_payments, :active_application, :allow_lottery_winner_emails, :allow_lottery_loser_emails, :registration_fee, :lottery_buffer, :application_open_directions, :application_closed_directions, :application_open_period]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors
    f.inputs 'ApplicationSetting' do
      f.input :active_application
      f.input :contest_year
      f.input :opendate
      f.input :application_open_period, label: "Length in Hours Application will be Open"

      f.input :application_open_directions, as: :quill_editor
      f.input :application_closed_directions, as: :quill_editor

      f.input :lottery_buffer
      f.input :application_buffer

      f.input :time_zone
      f.input :registration_fee
      f.input :allow_payments

      f.input :allow_lottery_winner_emails
      f.input :allow_lottery_loser_emails
    end
    f.actions
  end

end
