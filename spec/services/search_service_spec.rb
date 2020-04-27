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

    let(:channel_name) { "search:#{user}" }

    def perform
      described_class.new(user, text).perform
    end

    context 'when articles were NOT found' do
      it 'responds correctly' do
        expect(perform).to be_truthy
      end

      it 'does NOT broadcast anything' do
        expect { perform }.not_to broadcast_to(channel_name)
      end

      it 'creates a search' do
        expect { perform }.to change(Search, :count).from(0).to(1)
      end

      it 'does NOT attach articles to the search' do
        perform
        expect(Search.last.articles.count).to be_zero
      end
    end

    context 'when articles were found' do
      let!(:articles) { create_list :article, 10, title: text }

      it 'responds correctly' do
        expect(perform).to be_truthy
      end

      it 'broadcasts one message' do
        expect { perform }.to broadcast_to(channel_name)
      end

      it 'creates a search' do
        expect { perform }.to change(Search, :count).from(0).to(1)
      end

      context 'when inspecting the search attributes' do
        subject(:search) { Search.last }

        before { perform }

        its(:user) { is_expected.to eq user }
        its(:text) { is_expected.to eq text }
        its(:partial) { is_expected.to be_falsey }

        it 'attaches all articles to the search' do
          expect(search.article_ids).
            to match_array articles.map(&:id)
        end
      end
    end

    context 'when a partial search exists' do
      let!(:previous_search) do
        create :search, user: user, text: text[0..-2], partial: false
      end

      let!(:very_old_search) do
        create(
          :search,
          user: user,
          text: text[0..-2],
          partial: false,
          created_at: 1.minute.ago
        )
      end
      let!(:another_user_search) do
        create :search, user: user + '1', text: text[0..-2], partial: false
      end
      let!(:another_text_search) do
        create :search, user: user, text: text + '1', partial: false
      end

      before { perform }

      it 'marks the correct previous search as partial' do
        expect(previous_search.reload.partial).to be_truthy
      end

      it 'does not change the flag for other searches' do
        [
          very_old_search, another_user_search, another_text_search
        ].each do |unchanged_search|
          expect(unchanged_search.reload.partial).to be_falsey
        end
      end
    end
  end
end
