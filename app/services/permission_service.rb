class PermissionService
  attr_reader :user,
              :controller,
              :action

  def initialize(user)
    @user = user
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    if user && user.registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

  def registered_user_permissions
    return true if controller == 'stores'   && action.in?(%w(index show))
    return true if controller == 'sessions' && action.in?(%w(new create destroy))
  end

  def guest_user_permissions
    return true if controller == 'stores'   && action == 'index'
    return true if controller == 'sessions' && action.in?(%w(new create))
  end

end
