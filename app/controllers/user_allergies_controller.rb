class UserAllergiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @UserAllergy = UserAllergy.new
  end

  def create
    if params[:allergy_id]
      @allergy = Allergy.find(params[:allergy_id])
    else
      @allergy = Allergy.search(params[:allergy_name])
      @allergy = Allergy.create(name: "#{params[:allergy_name].capitalize}") unless @allergy[0].nil?
    end
    @user_allergy = UserAllergy.new
    @user_allergy.user = current_user || User.new
    @user_allergy.allergy = @allergy
    if @user_allergy.save
      redirect_to user_path(current_user)
    else
      render 'allergy#index'
    end
  end
end
