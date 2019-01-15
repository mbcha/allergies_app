class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    authorize @user
    @user_allergies = UserAllergy.where("user_id = ? ", @user.id)
    # @user_translations = UserTranslation.where("user_id = ?", @user.id)
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if params[:language_name] || params[:country_name]
      country = Country.where(name: params[:country_name])[0]
      language = Language.where(name: params[:language_name])[0]
      @user.update(country: country, language: language)
      @user.save
      redirect_to user_path(@user)
    else
      @user.update(user_params)
      @user.save
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :message, :language, :country)
  end
end
