class Article < ApplicationRecord
  include PgSearch::Model

  has_and_belongs_to_many :searches

  pg_search_scope(
    :search,
    against: %i(
      title
      author
      summary
      text
    ),
    using: {
      tsearch: {
        dictionary: "english",
      }
    }
  )

  validates :title, :author, :summary, :text, presence: true
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
