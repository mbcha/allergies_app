class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.string :name
      t.string :message
      t.references :allergy
      t.references :language

      t.timestamps
    end
  end
end
