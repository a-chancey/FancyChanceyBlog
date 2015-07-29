ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content do
    para "Welcome to the Admin Dashboard. You can create a new post by clicking the Posts link above."
  end
  action_item :view_site do
    link_to "View Site", "/"
  end
end
