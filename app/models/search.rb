class Search < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :user, :text, presence: true
end

# == Schema Information
#
# Table name: searches
#
#  id         :bigint           not null, primary key
#  text       :string
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
