class RenameCountryCodeinCountry < ActiveRecord::Migration[5.2]
  def change
    rename_column :countries, :country_code, :code
  end
end
