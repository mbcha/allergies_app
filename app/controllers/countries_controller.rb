class CountriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @countries = Country.all
    authorize @countries
    @user_countries = UserCountry.where("user_id = ?", current_user.id) if user_signed_in?
  end
end
