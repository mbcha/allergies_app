class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    authorize @user
    @user_allergies = UserAllergy.where("user_id = ? ", @user.id)
    @user_translations = UserTranslation.where("user_id = ?", @user.id)
    @user_countries = UserCountry.where("user_id = ?", @user.id)
  end
end
