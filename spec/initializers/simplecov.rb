require 'simplecov'

additional_groups = {
  'Services' => 'app/services'
}

if RSpec.configuration.files_to_run.length > 1
  # Coverage generation per file really slows down development as guard takes
  # a very long time between consecutive spec runs. Disable as needed.

  SimpleCov.start 'rails' do
    additional_groups.each { |title, path| add_group title, path }
  end

  required_coverage = 90.0
  SimpleCov.at_exit do
    SimpleCov.result.format!

    actual_coverage = SimpleCov.result.covered_percent

    print(
      "\n" \
      "TOTAL COVERAGE: #{actual_coverage.round 2}%, " \
      "requirement was #{required_coverage.round 2}% -"
    )

    if actual_coverage >= required_coverage
      puts "\e[0;32m SUCCESS! \e[0m\n"
    else
      puts "\e[0;31m FAIL! \e[0m\n"
      exit 1
    end
  end
end
