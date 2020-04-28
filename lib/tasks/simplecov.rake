# https://github.com/increments/simplecov-parallel/issues/1
if Rails.env.test?
  require_relative '../../spec/simple_cov_merger'
  namespace :simplecov do
    desc 'merge_results'
    task report_coverage: :environment do
      SimpleCovMerger.report_coverage
    end
  end
end
