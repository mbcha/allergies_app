class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @contacts = Contact.where("user_id = ?", @user.id)
    authorize @contacts
  end
end
