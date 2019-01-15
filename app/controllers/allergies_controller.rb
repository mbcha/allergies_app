class AllergiesController < ApplicationController
  def index
    @allergies = Allergy.all
    authorize @allergies
  end

  def show
    @language = Language.find(params[:language_id])
    @user = current_user
    @allergy = Allergy.find(params[:id])
    authorize @allergy
  end
end
