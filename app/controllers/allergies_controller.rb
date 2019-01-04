class AllergiesController < ApplicationController
  def index
    @allergies = Allergy.all
    authorize @allergies
  end

  def show
    @country = Country.find(params[:country_id])
    @allergy = Allergy.find("#{params[:id]}")
    authorize @allergy
  end
end
