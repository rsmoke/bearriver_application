ActiveAdmin.register ApplicationSetting do
  menu parent: "Application Configuration", priority: 1
  config.filters = false

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :opendate, :application_buffer, :contest_year, :time_zone, :allow_payments, :active_application, :allow_lottery_winner_emails, :allow_lottery_loser_emails, :registration_fee, :lottery_buffer, :application_open_directions, :application_closed_directions, :application_open_period, :registration_acceptance_directions, :payments_directions, :lottery_won_email, :lottery_lost_email
  #
  # or
  #
  # permit_params do
  #   permitted = [:opendate, :application_buffer, :contest_year, :time_zone, :allow_payments, :active_application, :allow_lottery_winner_emails, :allow_lottery_loser_emails, :registration_fee, :lottery_buffer, :application_open_directions, :application_closed_directions, :application_open_period]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    actions
    column :id do |id|
      link_to id.id, admin_application_setting_path(id)
    end
    column :active_application
    column :contest_year
    column :opendate
    column "# of hours to keep app open", :application_open_period
    column :application_buffer
    column :time_zone
    column "registration_fee" do |reg_fee|
      number_to_currency(reg_fee.registration_fee)
    end
    column :lottery_buffer
    column :lottery_run_date
    column "application_open_directions" do |open_text|
      open_text.application_open_directions[0..50] + "..." unless open_text.application_open_directions.nil?
    end
    column "application_closed_directions" do |close_text|
      close_text.application_closed_directions[0..50] + "..." unless close_text.application_closed_directions.nil?
    end
    column "registration_acceptance_directions" do |reg_text|
      reg_text.registration_acceptance_directions[0..50] + "..." unless reg_text.registration_acceptance_directions.nil?
    end
    column "payments_directions" do |pay_text|
      pay_text.payments_directions[0..50] + "..." unless pay_text.payments_directions.nil?
    end
    column "lottery_won_email" do |won_email|
      won_email.lottery_won_email[0..50] + "..." unless won_email.lottery_won_email.nil?
    end
    column "lottery_lost_email" do |lost_email|
      lost_email.lottery_lost_email[0..50] + "..." unless lost_email.lottery_lost_email.nil?
    end
    column :allow_payments
    column :allow_lottery_winner_emails
    column :allow_lottery_loser_emails
  end

  show do
    attributes_table do
      row :opendate
      row "# of hours to keep app open", &:application_open_period
      row :application_buffer
      row :contest_year
      row :time_zone
      row :allow_payments
      row :active_application
      row :allow_lottery_winner_emails
      row :allow_lottery_loser_emails
      row "registration_fee" do |reg_fee|
        number_to_currency(reg_fee.registration_fee)
      end
      row :lottery_buffer
      row :lottery_result
      row :lottery_run_date
      row :application_open_directions
      row :application_closed_directions
      row :registration_acceptance_directions
      row :payments_directions
      row :lottery_won_email
      row :lottery_lost_email
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs "ApplicationSetting" do
      f.input :active_application
      f.input :contest_year
      f.input :opendate
      f.input :time_zone
      f.input :application_open_period, label: "# of Hours App is OPEN"
      f.input :lottery_buffer
      f.input :application_buffer
      f.input :registration_fee

      f.input :application_open_directions
      f.input :application_closed_directions
      f.input :registration_acceptance_directions
      f.input :payments_directions

      f.input :lottery_won_email
      f.input :lottery_lost_email

      f.input :allow_payments
      f.input :allow_lottery_winner_emails
      f.input :allow_lottery_loser_emails
    end
    f.actions
  end
end
