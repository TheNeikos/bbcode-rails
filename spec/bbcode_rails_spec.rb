require 'spec_helper'

describe BBCode do
  it 'has a version number' do
    expect(BBCode::VERSION).not_to be nil
  end

  it 'correctly parses the i tag' do
    expect(ITag).not_to be nil
    expect(BBCode.parse "[i]Test[/i]").to eq "<em>Test</em>"
  end
end
