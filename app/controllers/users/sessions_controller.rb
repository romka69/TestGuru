class Users::SessionsController < Devise::SessionsController

  def create
    super

    flash[:login] = "Welcome, #{current_user.full_name}"
  end

end
