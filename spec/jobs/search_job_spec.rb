require 'rails_helper'

RSpec.describe SearchJob, type: :job do
  it 'creates a search through the service' do
    expect { described_class.perform_now('test', 'test') }.
      to change(Search, :count).by(1)
  end
end
