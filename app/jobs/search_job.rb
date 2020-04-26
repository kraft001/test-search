class SearchJob < ApplicationJob
  queue_as :default

  def perform(user_id, search_text)
    service = SearchService.new user_id, search_text
    service.perform
  end
end
