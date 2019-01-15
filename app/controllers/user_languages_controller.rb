class UserLanguagesController < ApplicationController
  before_action :extract_info, only: [:create, :create_new, :update]

  def create
    if @existing_user_language.nil?
      create_new
    else
      update
    end
  end

  def create_new
    @user_language = UserLanguage.new
    @user_language.language = @language
    @user_language.user = current_user
    authorize @user_language
    if @user_language.save
      redirect_to user_path(current_user)
    else
      render 'countries#index'
    end
  end

  def update
    authorize @existing_user_language
    @existing_user_language.update(updated_at: DateTime.now)
    if @existing_user_language.save
      redirect_to user_path(current_user)
    else
      render 'countries#index'
    end
  end

  private

  def extract_info
    @language = Language.find(params[:language_id])
    @existing_user_language = UserLanguage.search(@language.id, current_user.id)[0]
  end
end
