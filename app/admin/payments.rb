ActiveAdmin.register Payment do
  actions :index, :show, :create, :new, :edit
  menu parent: "User Mangement", priority: 4

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :transaction_type, :transaction_status, :transaction_id, :total_amount, :transaction_date, :account_type, :result_code, :result_message, :user_account, :payer_identity, :timestamp, :transaction_hash, :user_id, :conf_year
  #
  # or
  #
  # permit_params do
  #   permitted = [:transaction_type, :transaction_status, :transaction_id, :total_amount, :transaction_date, :account_type, :result_code, :result_message, :user_account, :payer_identity, :timestamp, :transaction_hash, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :user, as: :select
  index do
    selectable_column
    actions
    column :id do |id|
      link_to id.id, admin_payment_path(id)
    end
    column :user
    column :conf_year
    column :transaction_type
    column "total_amount" do |amount|
      number_to_currency(amount.total_amount.to_f / 100)
    end
    column :transaction_status
    # column :transaction_id

    column :transaction_date
    column :account_type
    column :result_code
    column :result_message
    # column :user_account
    # column :payer_identity
    # column :timestamp
    # column :transaction_hash
    column :created_at
    column :updated_at
  end

  show do
    attributes_table do
      row :user
      row :conf_year
      row :transaction_type
      row :transaction_status
      row :transaction_id
      row "total_amount" do |amount|
        number_to_currency(amount.total_amount.to_f / 100)
      end
      row :transaction_date
      row :account_type
      row :result_code
      row :result_message
      row :user_account
      row :payer_identity
      row :timestamp
      row :transaction_hash
      row :user_id
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs "Payment" do
      f.input :user
      li "Conf Year #{f.object.conf_year}" unless f.object.new_record?
      f.input :conf_year, input_html: {value: ApplicationSetting.get_current_app_year} unless f.object.persisted?
      f.input :transaction_type, as: :hidden, :input_html => { value: "ManuallyEntered" } # ManualEntry
      f.input :transaction_status, as: :hidden, :input_html => { value: "1" } # 1
      f.input :transaction_id, as: :hidden, :input_html => { value: DateTime.now.iso8601 + "_" + current_admin_user.email } # DateTime.now.iso8601 + current_admin_user.email
      f.input :total_amount # 10000 => 100.00
      f.input :transaction_date, as: :datepicker # DateTime.now.iso8601
      f.input :account_type, label: "Enter Check# or Transaction#" # 'Check #xxxx'
      f.input :result_code, as: :hidden, :input_html => { value: "Manually Entered" } # 'Manually Entered'
      f.input :result_message, as: :hidden, :input_html => { value: "This was manually entered by #{current_admin_user.email}" } # "This was manually entered by #{current_admin_user} for #{:user.email}"
      #f.input :user_account # :user.email + '-' + :user.id
      #f.input :payer_identity # :user.email
      f.input :timestamp, as: :hidden, :input_html => { value: DateTime.now.strftime("%Q").to_i } # DateTime.now.strftime("%Q").to_i
    end
    #f.actions
    f.actions
  end
end
