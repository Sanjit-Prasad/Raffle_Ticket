class AddMoreFieldsToWinners < ActiveRecord::Migration[5.2]
  def change
    add_reference :winners, :user, foreign_key: true
    add_reference :winners, :reward, foreign_key: true
  end
end
