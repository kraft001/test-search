class Search < ApplicationRecord
  # has_many through is better if we're going to expand the project
  has_and_belongs_to_many :articles # rubocop:disable Rails/HasAndBelongsToMany

  validates :user, :text, presence: true
end

# == Schema Information
#
# Table name: searches
#
#  id         :bigint           not null, primary key
#  partial    :boolean          default(FALSE)
#  text       :string
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
