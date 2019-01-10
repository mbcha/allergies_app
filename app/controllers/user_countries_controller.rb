class UserCountriesController < ApplicationController
  before_action :extract_info, only: [:create, :create_new, :update]

  def create
    if @existing_user_country.nil?
      create_new
    else
      update
    end
  end

  def create_new
    @user_country = UserCountry.new
    @user_country.country = @country
    @user_country.user = current_user
    authorize @user_country
    if @user_country.save
      redirect_to user_path(current_user)
    else
      render 'countries#index'
    end
  end

  def update
    authorize @existing_user_country
    @existing_user_country.update(updated_at: DateTime.now)
    if @existing_user_country.save
      redirect_to user_path(current_user)
    else
      render 'countries#index'
    end
  end

  private

  def extract_info
    @country = Country.find(params[:country_id])
    @existing_user_country = UserCountry.where("country_id = ? AND user_id = ?", @country.id, current_user.id)[0]
  end
end
