class SearchJob < ApplicationJob
  queue_as :default

  def perform(user_id, search_text)
    found_articles = Article.search(search_text).order(:title).limit(10)
    # broadcast right away
    SearchChannel.broadcast_to(
      user_id,
      JSONAPI::Serializer.serialize(found_articles, is_collection: true)
    )

    # and then save to the database
    search = Search.create user: user_id, text: search_text
    search.articles = found_articles
    search.finish!

    # TODO: mark the previous search as incomplete if necessary
  end
end
