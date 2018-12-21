class CreateUserTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_translations do |t|
      t.references :translation
      t.references :user

      t.timestamps
    end
  end
end
