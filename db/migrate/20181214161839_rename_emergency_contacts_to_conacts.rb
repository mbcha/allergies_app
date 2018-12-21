class RenameEmergencyContactsToConacts < ActiveRecord::Migration[5.2]
  def change
    rename_table :emergency_contacts, :contacts
  end
end
