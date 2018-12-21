class CreateEmergencyContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :phone_number
      t.string :relationship
      t.string :email
      t.references :user

      t.timestamps
    end
  end
end
