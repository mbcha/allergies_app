class AddMessageToUser < ActiveRecord::Migration[5.2]
  unless ActiveRecord::Base.connection.column_exists? :users, :message
    def change
      add_column :users, :message, :text
    end
  end
end
