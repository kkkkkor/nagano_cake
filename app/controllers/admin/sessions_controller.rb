# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    admin = Admin.find_by(email: params[:admin][:email])
    if admin && admin.valid_password?(params[:admin][:password])
      sign_in admin
      redirect_to admin_root_path
    end
    # super
  end
  # def after_sign_out_path_for(resource)
  #   flash[:notice] = "ログアウトしました"
  #   admin_session_path
  # end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
