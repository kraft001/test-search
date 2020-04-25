class Search < ApplicationRecord
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
