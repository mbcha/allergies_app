class RenameLanguageCodeinLanguage < ActiveRecord::Migration[5.2]
  def change
    rename_column :languages, :language_code, :code
  end
end
