# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    #   div class: 'blank_slate_container', id: 'dashboard_default_message' do
    # span class: 'blank_slate' do
    # span I18n.t('active_admin.dashboard_welcome.welcome')
    # small I18n.t('active_admin.dashboard_welcome.call_to_action')
    # end
    # end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel 'Fisrt 10 Ads' do
          ul do
            Ad.all.first(10).map do |ad|
              li link_to(ad.title, admin_ad_path(ad))
            end
          end
        end
      end

      column do
        panel 'Fisrt 10 Users' do
          ul do
            User.all.first(10).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end
    end
  end
end
