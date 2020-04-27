require 'rails_helper'

RSpec.describe SearchChannel, type: :channel do
  before do
    # initialize connection with identifiers
    stub_connection uuid: uuid
    subscribe
  end

  let(:uuid) { 'test' }

  describe 'subscription' do
    it 'successfully subscribes' do
      expect(subscription).to be_confirmed
    end

    it 'subscribes to the correct stream' do
      expect(subscription).to have_stream_from("search:#{uuid}")
    end
  end

  describe 'search' do
    it 'enqueues the correct job' do
      expect { perform(:search, { 'text' => 'test' }) }.
        to have_enqueued_job.with(uuid, 'test')
    end
  end
end
