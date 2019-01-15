class CreateUserLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_languages do |t|
      t.references :language
      t.references :user

      t.timestamps
    end
  end
end
