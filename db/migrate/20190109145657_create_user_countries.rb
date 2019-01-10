class CreateUserCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_countries do |t|
      t.references :user
      t.references :country

      t.timestamps
    end
  end
end
