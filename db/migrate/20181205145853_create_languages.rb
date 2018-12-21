class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :language_code

      t.timestamps
    end
  end
end
