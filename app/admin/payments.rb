ActiveAdmin.register Payment do
  menu parent: "User Mangement", priority: 4

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :transaction_type, :transaction_status, :transaction_id, :total_amount, :transaction_date, :account_type, :result_code, :result_message, :user_account, :payer_identity, :timestamp, :transaction_hash, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:transaction_type, :transaction_status, :transaction_id, :total_amount, :transaction_date, :account_type, :result_code, :result_message, :user_account, :payer_identity, :timestamp, :transaction_hash, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id do |id|
      link_to id.id, admin_payment_path(id)
    end
    column :user
    column :transaction_type
    column :transaction_status
    column :transaction_id
    column "total_amount" do |amount|
      number_to_currency(amount.total_amount.to_f / 100)
    end
    column :transaction_date
    column :account_type
    column :result_code
    column :result_message
    column :user_account
    column :payer_identity
    column :timestamp
    column :transaction_hash
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :user
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
end
