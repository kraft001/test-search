require 'rails_helper'

RSpec.describe 'Search show page', type: :feature do
  before { visit search_path }

  it 'displays the search input' do
    expect(page).to have_css('input.search-box__input')
  end

  it 'displays the search button' do
    expect(page).to have_css('button.search-box__button')
  end
end
