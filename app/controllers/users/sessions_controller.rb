class Users::SessionsController < Devise::SessionsController

  def create
    super

    flash[:success] = "Welcome, #{current_user.full_name}"
  end

end