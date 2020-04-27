require 'rails_helper'

RSpec.describe 'Stats index page', type: :feature do
  before { visit stats_path }

  it 'displays 3 interval blocks' do
    %w[hour day week].each do |interval|
      expect(page).to have_css('.interval__header', text: interval.upcase)
    end
  end
end
