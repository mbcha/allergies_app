class UserAllergiesController < ApplicationController
  def create
    if params[:allergy_id]
      @allergy = Allergy.find(params[:allergy_id])
    else
      @allergy = Allergy.search(params[:allergy_name])
      @allergy = Allergy.create(name: params[:allergy_name].capitalize) unless @allergy[0].nil?
    end
    @user_allergy = UserAllergy.new
    @user_allergy.user = current_user || User.new
    @user_allergy.allergy = @allergy
    authorize @user_allergy
    if @user_allergy.save
      redirect_to user_path(current_user)
    else
      render 'allergy#index'
    end
  end

  def destroy
    @allergy = Allergy.find(params[:id])
    @user_allergy = UserAllergy.search(@allergy.id, current_user.id)
    authorize @user_allergy
    @user_allergy.destroy
    redirect_to user_path(current_user)
  end
end
