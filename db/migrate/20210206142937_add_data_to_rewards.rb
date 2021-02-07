class AddDataToRewards < ActiveRecord::Migration[5.2]
  def up
    rewards = []

    Ticket.all.each do |t|
      rewards << Reward.new(title: Faker::Vehicle.manufacture, ticket_id: t.id, used: "NO")
    end

    Reward.import(rewards)
  end

  def down
    Reward.destroy_all
  end
end