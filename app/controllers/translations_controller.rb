class TranslationsController < ApplicationController
  # before_action :extract_info, only: %i[show create]
  skip_before_action :authenticate_user!, only: %i[create show]

  def show
    @translation = Translation.find(params[:id])
    @translation_warning = @translation.message.split(":")[0]
    @translation_message = @translation.message.split(":")[1]
  end

  def create
    @allergy = Allergy.find(params[:allergy_id])
    @country = Country.find(params[:country_id])
    @language = Language.find_by_code(@country.language_code)
    @translation = Translation.new
    @translation.allergy = @allergy
    @translation.language = @language
    @translation.name = params[:name]
    @translation.message = params[:message]

    @translation.save
    redirect_to translation_path(@translation)
  end

  private

  def extract_info
  end
end
