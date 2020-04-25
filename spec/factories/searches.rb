FactoryBot.define do
  factory :search do
    user { Faker::Lorem.characters(number: 10) }
    text { Faker::Lorem.word }
  end
end

# == Schema Information
#
# Table name: searches
#
#  id          :bigint           not null, primary key
#  finished_at :datetime
#  text        :string
#  user        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
