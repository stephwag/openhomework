module ApplicationHelper
  def is_active_controller(controller_name)
      params[:controller] == controller_name ? "active" : nil
  end
end
