# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @users = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name,email,:profile)
  end

  
end
