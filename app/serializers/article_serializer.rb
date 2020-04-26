class ArticleSerializer
  include JSONAPI::Serializer

  attributes :title, :author, :summary
end
