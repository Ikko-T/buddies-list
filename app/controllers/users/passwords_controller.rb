class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_guest_user, only: :create

  def ensure_guest_user
    if params[:user][:email].downcase == "guest@example.com"
      redirect_to new_user_session_path, alert: "The guest user's password cannot be reset"
    end
  end
end
