class UserAllergiesController < ApplicationController
  before_action :extract_info, only: [:create]

  def create
    if @existing_user_allergy.nil?
      user_allergy = UserAllergy.new
      user_allergy.user = current_user
      user_allergy.allergy = @allergy
      authorize user_allergy
      if user_allergy.save
        redirect_to user_path(current_user)
      else
        render 'allergy#index'
      end
    else
      authorize @existing_user_allergy
      redirect_to user_path(current_user)
    end
  end

  def destroy
    allergy = Allergy.find(params[:id])
    user_allergy = UserAllergy.find_by_allergy(allergy.id, current_user.id).first
    authorize user_allergy
    user_allergy.destroy
    redirect_to user_path(current_user)
  end

  private

  def extract_info
    if params[:allergy_id]
      @allergy = Allergy.find(params[:allergy_id])
    else
      @allergy = Allergy.search(params[:allergy_name])
      @allergy = Allergy.create(name: params[:allergy_name].capitalize) unless @allergy[0].nil?
    end
    @existing_user_allergy = UserAllergy.find_by_allergy(@allergy.id, current_user.id)[0]
  end
end
