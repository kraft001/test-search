FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    author { Faker::Name.name }
    summary { Faker::Lorem.paragraph }
    text { Faker::Lorem.paragraph_by_chars(number: 2000) }
  end
end

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  author     :string
#  summary    :string
#  text       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
