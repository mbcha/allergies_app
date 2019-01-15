class CountriesController < ApplicationController
  def index
    @countries = Country.all
    authorize @countries
    @user = current_user
  end
end
