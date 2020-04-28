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
end
