# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
  def create

    @user = User.new(params[:configure_sign_up_params])
    @user.save
    # respond_to do |format|
      if @user.save
        UserMailer.with(user: @user).welcome_email.deliver_later
        redirect_to @user, notice: 'User was successfully created.' and return
        # format.json { render json: @user, status: :created, location: @user and return }
      else
        # render action: 'new' and return
        # format.json { render json: @user.errors, status: :unprocessable_entity and return}
      end
    # end
    super
  end

  # GET /resource/edit
  def edit
    # super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
   # def destroy
   #   super
   # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def detail
     @user = User.find_by(id: params[:id])
  end
  #
   protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    "/users/#{current_user.id}" and return
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    added_attrs = [:name, :username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    added_attrs = [:name, :username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
