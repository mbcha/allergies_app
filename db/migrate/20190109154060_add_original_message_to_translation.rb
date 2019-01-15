class AddOriginalMessageToTranslation < ActiveRecord::Migration[5.2]
  def change
    add_column :translations, :original_message, :text
  end
end
