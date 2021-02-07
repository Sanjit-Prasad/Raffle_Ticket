class AddMoreFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :integer
    add_column :users, :gender, :string
    add_reference :users, :ticket, foreign_key: true
  end
end
