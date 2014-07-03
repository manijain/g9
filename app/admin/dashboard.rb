ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do

  columns do
    column do
      panel "Recent Properties" do
        table_for Property.order('id desc').limit(10) do
          column("Title")   {|property| link_to(property.title, admin_property_path(property))} 
          #column("Posted by"){|property| link_to(property.user.email, admin_user_path(property.user)) } 
          column("Total Amount") {|property| number_with_delimiter property.approx_price}
          column("approved") {|property| property.is_approved} 
        end
      end
    end

    column do
      panel "Recent Users" do
        table_for User.order('id desc').limit(10).each do |user|
          column(:email) {|user| link_to(user.email, admin_user_path(user)) }
          #column(:role_id) {|user| (user.role_id) }
          column(:phone) {|user| (user.phone)}
        end
      end
    end
  end

  # column do
  #   column do
  #     panel "ActiveAdmin Demo" do
  #       div do
  #         render('/admin/sidebar_links', :model => 'dashboards')
  #       end

  #       div do
  #         text_node %{<iframe src="https://rpm.newrelic.com/public/charts/6VooNO2hKWB" width="500" height="300" scrolling="no" frameborder="no"></iframe>}.html_safe
  #       end
  #     end
  #   end
  # end
  
  # action_item do
  #   link_to "View Site", "/"
  # end

  # sidebar :properties do
  #   ul do
  #     li "Recent added property"
  #     li link_to("properties", admin_properties_path)
  #   end
  # end
  end
end