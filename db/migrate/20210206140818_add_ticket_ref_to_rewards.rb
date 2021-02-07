class AddTicketRefToRewards < ActiveRecord::Migration[5.2]
  def change
    add_reference :rewards, :ticket, foreign_key: true
    add_column :rewards, :used, :string
  end
end
