require 'rails_helper'

# rubocop:disable RSpec/FilePath
RSpec.describe ApplicationCable::Connection, type: :channel do
  it 'successfully connects' do
    connect '/cable'
    expect(connection.uuid).to be_present
  end
end
# rubocop:enable RSpec/FilePath
