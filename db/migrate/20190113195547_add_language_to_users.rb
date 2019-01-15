class AddLanguageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :language, foreign_key: true
    add_reference :users, :country, foreign_key: true
  end
end
