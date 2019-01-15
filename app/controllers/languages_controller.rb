class LanguagesController < ApplicationController
  def index
    @languages = Language.all
    authorize @languages
    @user = current_user
  end
end
