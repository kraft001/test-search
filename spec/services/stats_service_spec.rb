require 'rails_helper'

RSpec.describe StatsService do
  subject(:service) { described_class.new(:hour) }

  let(:texts_and_counts) do
    10.times.map do |index|
      [Faker::Lorem.unique.word, index + 1]
    end
  end
  let(:bad_word) { Faker::Lorem.unique.word }

  describe '.analytics' do
    before do
      # correct searches
      texts_and_counts.map do |text, index|
        create_list :search, index, text: text
      end
      # very_old_search
      create_list :search, 20, created_at: 2.hours.ago, text: bad_word
      # partial_search
      create_list :search, 20, partial: true, text: bad_word
    end

    it 'selects correct texts in the correct order' do
      expect(service.analytics).to eq(texts_and_counts)
    end

    it 'truncates the data correctly' do
      expect(service.all_data[:analytics]).
        to eq(texts_and_counts.last(5).reverse.to_h)
    end
  end

  describe '.trends' do
    before do
      # trending searches
      texts_and_counts.map do |text, index|
        create_list :search, index, text: text, created_at: 70.minutes.ago
        create_list :search, 2 * index, text: text
      end
      # very_old_search
      create_list :search, 1, created_at: 3.hours.ago, text: bad_word
      # partial_search
      create_list :search, 20, partial: true, text: bad_word
    end

    it 'selects correct texts in the correct order' do
      expect(service.trends).to eq(texts_and_counts)
    end

    it 'truncates the data correctly' do
      expect(service.all_data[:trends]).
        to eq(texts_and_counts.last(5).reverse.to_h)
    end
  end
end
