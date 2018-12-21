class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @user = User.find(params[:id])
    @user_allergies = UserAllergy.where("user_id = #{@user.id}")
    @user_translations = UserTranslation.where("user_id = #{@user.id}")
    @user_countries = UserCountry.where("user_id = #{@user.id}")
  end
end
