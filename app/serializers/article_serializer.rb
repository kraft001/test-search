class ArticleSerializer
  include JSONAPI::Serializer

  attributes :title, :author, :summary
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
