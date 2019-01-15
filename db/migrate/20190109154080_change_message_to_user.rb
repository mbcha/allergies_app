class ChangeMessageToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :message, :text, default: "This person suffers from food allergies"
  end
end
