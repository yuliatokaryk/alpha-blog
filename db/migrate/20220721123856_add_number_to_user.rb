class AddNumberToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :number, :number
  end
end
