class StatsService
  attr_reader :interval, :now, :one_interval

  def initialize(interval)
    @interval = interval
    @one_interval = 1.public_send(interval)
    @now = Time.zone.now
  end

  def all_data
    {
      analytics: analytics.last(5).reverse.to_h,
      trends: trends.last(5).reverse.to_h
    }
  end

  def analytics(finish_at = nil)
    finish_at ||= now
    start_at = finish_at - one_interval

    Search.
      where(
        created_at: start_at..finish_at,
        partial: false
      ).
      group(:text).
      count.
      sort_by(&:second)
  end

  def trends
    start_analytics = analytics(now - one_interval).to_h
    finish_analytics = analytics

    # calculate the change and then sort
    finish_analytics.
      map { |text, count| [text, count - start_analytics[text].to_i] }.
      sort_by(&:second)
  end
end
