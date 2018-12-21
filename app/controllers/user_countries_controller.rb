class UserCountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @country = Country.find(params[:country_id])
    existing_user_country = UserCountry.where("country_id = ?", @country.id)[0]
    if existing_user_country.nil?

      @user_country = UserCountry.new
      @user_country.country = @country
      @user_country.user = current_user || User.new
      if @user_country.save
        redirect_to user_path(current_user)
      else
        render 'countries#index'
      end

    else
      existing_user_country.update(updated_at: DateTime.now)
      if existing_user_country.save
        redirect_to user_path(current_user)
      else
        render 'countries#index'
      end
    end
  end
end
