class CreateUserAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_allergies do |t|
      t.references :user
      t.references :allergy

      t.timestamps
    end
  end
end
