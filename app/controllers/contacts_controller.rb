class ContactsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index

  def index
    @user = User.find(params[:user_id])
    @contacts = Contact.where("user_id = ?", @user.id)
  end
end
