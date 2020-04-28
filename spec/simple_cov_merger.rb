require 'simplecov'

class SimpleCovMerger
  class << self
    def report_coverage
      new.merge_results
    end
  end

  def initialize; end

  def merge_results
    Rails.logger.info "Available files: #{results_filenames.join(', ')}"

    SimpleCov::ResultMerger.clear_resultset
    merged_result = SimpleCov::ResultMerger.merge_results(*all_results)
    merged_result.format!
    return if merged_result.covered_percent >= 90

    exit SimpleCov::ExitCodes::MINIMUM_COVERAGE
  end

  protected

  def results_filenames
    Dir[Rails.root.join('coverage_results/*.json')]
  end

  def all_results
    results_filenames.map do |result_file_name|
      body = File.read(result_file_name)
      next if body.blank?

      SimpleCov::Result.from_hash JSON.parse(body)
    end.compact
  end
end
