class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @contacts = Contact.where("user_id = ?", current_user.id)
    authorize @contacts
  end

  def create
    user = User.find(params[:user_id])
    @contact = Contact.create(contact_params)
    @contact.user = user
    authorize @contact
    if @contact.save
      redirect_to user_contacts_path(user)
    else
      flash[:new_not_valid] = @contact.errors
      redirect_to user_contacts_path(user) + "#newcontact"
    end
  end

  def update
    contact = Contact.find(params[:id])
    authorize contact
    contact.update(contact_params)
    if contact.save
      redirect_to user_contacts_path(current_user)
    else
      flash[:update_not_valid] = contact.errors
      name = contact.name.gsub(" ", "")
      redirect_to user_contacts_path(current_user) + "##{name}" + "#updatecontact"
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    authorize contact
    contact.destroy
    redirect_to user_contacts_path(current_user)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :relationship, :email, :phone_number)
  end
end
