class AddDataToWinners < ActiveRecord::Migration[5.2]
  def up
    winners = []

    Reward.all.each do |t|
      user = User.find_by(ticket_id: t.ticket_id)
      winners << Winner.new(
        user_id: user.id,
        reward_id: t.id
      )
    end

    Winner.import(winners)
  end

  def down
    Winner.destroy_all
  end
end
