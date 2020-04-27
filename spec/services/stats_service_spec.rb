require 'rails_helper'

RSpec.describe StatsService do
  subject(:service) { described_class.new(:hour) }

  describe '.analytics' do
    let(:texts) do
      Array.new(10).map { Faker::Lorem.unique.word }
    end

    before do
      # correct searches
      texts.each_with_index.map do |text, index|
        create_list :search, index + 1, text: text
      end
      # very_old_search)
      create_list :search, 20, created_at: 2.hours.ago
      # partial_search)
      create_list :search, 20, partial: true
    end

    it 'selects correct texts in the correct order' do
      expect(service.analytics).
        to eq(texts.each_with_index.map { |text, count| [text, count + 1] })
    end
  end
end
