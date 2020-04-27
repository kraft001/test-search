namespace :search do
  desc 'Create random search records for stats'
  task fill: :environment do
    50.times do
      text = Faker::Lorem.word
      50.times do
        time = Time.zone.now - rand(2.weeks.to_i).seconds

        Search.create(
          text: text,
          partial: false,
          user: Faker::Lorem.characters(number: 20),
          created_at: time
        )
      end
    end
  end
end
