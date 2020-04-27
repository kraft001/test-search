class StatsController < ApplicationController
  def index
    @stats_data =
      %i[hour day week].inject({}) do |result, interval|
        service = StatsService.new interval

        result.merge interval => service.all_data
      end
  end
end
