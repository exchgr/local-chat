module UsersHelper

  def className
	[controller.controller_name, controller.action_name].join(" ")
  end
end
