class CountriesController < ApplicationController
  def index
    @countries = Country.all
    authorize @countries
    @user_countries = UserCountry.where("user_id = ?", current_user.id)
  end
end
