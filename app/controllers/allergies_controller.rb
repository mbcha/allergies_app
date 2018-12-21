class AllergiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @allergies = Allergy.all
  end

  def show
    @country = Country.find(params[:country_id])
    @allergy = Allergy.find("#{params[:id]}")
  end
end
