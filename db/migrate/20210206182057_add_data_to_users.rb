class AddDataToUsers < ActiveRecord::Migration[5.2]
  def up
    users = []

    Ticket.all.each do |t|
      users << User.new(
        name: Faker::Name.name,
        password: "123456789",
        email: Faker::Internet.email,
        gender: Faker::Gender.binary_type,
        phone: Faker::Base.numerify('####'),
        ticket_id: t.id
      )
    end

    User.import(users)
  end

  def down
    User.destroy_all
  end
end