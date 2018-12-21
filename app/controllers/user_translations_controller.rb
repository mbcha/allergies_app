class UserTranslationsController < ApplicationController
  before_action :extract_info, only: %i[create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    user_translation = UserTranslation.new
    user_translation.user = current_user
    user_translation.translation = Translation.new

    user_translation.save
    redirect_to country_allergy_translation_path(@country, @allergy, translation) + "/#googtrans(original|#{@language.code})"
  end

  private

  def extract_info
    @allergy = Allergy.find(params[:allergy_id])
    @country = Country.find(params[:country_id])
    @language = Language.find_by_code(@country.language_code)
  end
end
