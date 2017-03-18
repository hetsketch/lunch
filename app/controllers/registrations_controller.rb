# Because User should have "name", I've created this class
# to perform "name" fild while sign up & edit profile
class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end