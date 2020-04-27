require 'rails_helper'

RSpec.describe SearchService do
  describe 'with incorrect data' do
    it 'fails if the user_id is blank' do
      expect(described_class.new('', 'test').perform).to be_falsey
    end

    it 'fails if the text is blank' do
      expect(described_class.new('test', '').perform).to be_falsey
    end
  end

  describe 'with correct data' do
    let(:user) { Faker::Lorem.word }
    let(:text) { Faker::Lorem.word }

    def perform
      described_class.new(user, text).perform
    end

    context 'when articles were NOT found' do
      it 'responds correctly' do
        expect(perform).to be_truthy
      end

      it 'does NOT broadcast anything' do
        expect { perform }.not_to broadcast_to(user)
      end

      it 'creates a search' do
        expect { perform }.to change(Search, :count).from(0).to(1)
      end

      it 'does NOT attach articles to the search' do
        perform
        expect(Search.last.articles.count).to be_zero
      end
    end
  end
end
