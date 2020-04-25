class SearchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "search:#{uuid}"
  end

  def search(data)
    SearchJob.perform_later uuid, data['text']
  end
end
