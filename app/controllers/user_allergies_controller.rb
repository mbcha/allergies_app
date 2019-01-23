class UserAllergiesController < ApplicationController
  before_action :extract_info, only: [:create]

  def create
    if @existing_user_allergy.nil?
      user_allergy = UserAllergy.new
      user_allergy.user = current_user
      user_allergy.allergy = @allergy
      authorize user_allergy
      if user_allergy.save
        redirect_to user_path(current_user)
      else
        render 'allergy#index'
      end
    else
      authorize @existing_user_allergy
      redirect_to user_path(current_user)
    end
  end

  def destroy
    allergy = Allergy.find(params[:id])
    user_allergy = UserAllergy.find_by_allergy(allergy.id, current_user.id).first
    authorize user_allergy
    user_allergy.destroy
    redirect_to user_path(current_user)
  end

  private

  def extract_info
    if params[:allergy_id]
      @allergy = Allergy.find(params[:allergy_id])
    else
      @allergy = Allergy.search(params[:allergy_name])
      unless @allergy[0].nil?
        create_allergy(params[:allergy_name])
      end
    end
    @existing_user_allergy = UserAllergy.find_by_allergy(@allergy.id, current_user.id)[0]
  end

  def create_allergy(name)
    @allergy = Allergy.create(name: name.capitalize)
    name = name.gsub(' ', '-').split(';')

    html_photos = open("https://unsplash.com/search/photos/#{name[0]}").read
    doc_photos = Nokogiri::HTML(html_photos)
    photo = doc_photos.search('._1pn7R').first

    if photo.nil?
      html_photos = open("https://www.freeimages.com/search/#{name[0]}").read
      doc_photos = Nokogiri::HTML(html_photos)

      results = doc_photos.search('.listing-primary')
      unless results.empty?
        url = results.search('.item img').first['src']

        @allergy.update(remote_photo_url: url)
        @allergy.save
      end
    else
      url = photo.search('.yVU8k a img').first['src']

      @allergy.update(remote_photo_url: url)
      @allergy.save
    end
  end
end
