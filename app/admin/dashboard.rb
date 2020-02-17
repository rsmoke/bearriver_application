ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    if (current_application_settings.opendate + current_application_settings.application_open_period.hours) < Time.now
      if current_application_settings.lottery_result.nil?
        div do
          span do
            button_to "Run Lottery", run_lotto_path
          end
        end
      end
    end

    columns do
      column do
        panel "Applicants who accepted their registration offer" do
          table_for Application.application_accepted.order("id desc").limit(110) do
            column("User") { |u| link_to(u.user.email, admin_application_path(u.id)) }
            column("Offer Date") { |od| od.offer_status_date }
          end
        end
      end

      column do
        panel "Waiting for responses from these applicants" do
          table_for Application.application_offered.order("id desc").limit(50) do
            column("User") { |u| link_to(u.user.email, admin_application_path(u.id)) }
            column("Offer Date") { |od| od.offer_status_date }
          end
        end
      end
    end # columns

    columns do
      column do
        panel "Recent Users" do
          table_for User.order("id desc").limit(10).each do |user|
            column(:email) { |user| link_to(user.email, admin_user_path(user)) }
          end
        end
      end

      column do
        panel "Recent Applications" do
          table_for Application.order("id desc").limit(10).each do |app|
            column(:id) { |app| link_to(app.name, admin_application_path(app)) }
          end
        end
      end

      column do
        panel "Recent Payments" do
          table_for Payment.order("id desc").limit(10) do
            column("User") { |u| link_to(u.user.email, admin_user_path(u.user)) }
            # column("Customer") { |order| link_to(order.user.email, admin_user_path(order.user)) }
            column("Amount") { |order| number_to_currency order.total_amount.to_f / 100 }
          end
        end
      end
    end
  end # content
end
