class TranslationsController < ApplicationController
  def index
    user_allergies = UserAllergy.where("user_id = ? ", current_user.id)
    language = Language.find(params[:language_id])
    @translations = user_allergies.map do |user_allergy|
      allergy = Allergy.find(user_allergy.allergy.id)
      Translation.find_by_allergy_and_language(allergy.id, language.id, current_user.message)[0]
    end
    line = @translations[0].message
    @translation_warning = line.split(":")[0]
    @translation_message = line.split(":")[1]
    authorize @translations[0]
  end

  def show
    @translation = Translation.find(params[:id])
    authorize @translation
    @translation_warning = @translation.message.split(":")[0]
    @translation_message = @translation.message.split(":")[1]
  end

  def create
    @allergy = Allergy.find(params[:allergy_id])
    @language = Language.find(params[:language_id])
    @translation = Translation.new
    @translation.allergy = @allergy
    @translation.language = @language
    @translation.name = params[:name].capitalize
    @translation.message = params[:message]
    @translation.original_message = params[:original_message]
    authorize @translation
    @translation.save
    redirect_to translation_path(@translation)
  end
end
