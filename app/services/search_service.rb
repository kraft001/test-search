class SearchService
  attr_reader :user_id, :search_text, :search

  def initialize(user_id, search_text)
    @search_text = search_text&.strip
    @user_id = user_id&.strip
  end

  def perform
    # we need this validation here because
    # we run the search before saving it to db
    return if search_text.blank? || user_id.blank?

    # broadcast right away
    broadcast

    # and then work with the database
    save
    update_partial
  end

  protected

  def found_articles
    @found_articles ||=
      Article.search(search_text).order(:title).limit(10)
  end

  def broadcast
    serialized_articles =
      JSONAPI::Serializer.serialize(found_articles, is_collection: true)

    SearchChannel.broadcast_to user_id, serialized_articles
  end

  def save
    # and then save to the database
    @search = Search.create user: user_id, text: search_text
    @search.articles = found_articles
  end

  def previous_searches
    Search.
      where(partial: false, user: user_id).
      where('created_at >= ?', search.created_at - 3.seconds).
      where('created_at < ?', search.created_at)
  end

  def update_partial
    previous_searches.each do |previous_search|
      next unless search_text.include?(previous_search.text)

      previous_search.update partial: true
    end
  end
end
