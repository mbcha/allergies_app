class AddPhotoToAllergies < ActiveRecord::Migration[5.2]
  def change
    add_column :allergies, :photo, :string
  end
end
