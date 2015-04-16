require 'spec_helper'

describe BBCode do
  it 'has a version number' do
    expect(BBCode::VERSION).not_to be nil
  end

  it 'correctly parses the i tag' do
    expect(ITag).not_to be nil
    expect(BBCode.parse "[i]Test[/i]").to eq "<em>Test</em>"
  end

  it 'correctly parses the br tag' do
    expect(BrTag).not_to be nil
    expect(BBCode.parse "[br]").to eq "<br>"
  end

  it 'correctly parses the user tag' do
    expect(UserTag).not_to be nil
    expect(BBCode.parse "[user=Neikos]").to eq "<p>Name: Neikos</p>"
  end

  it 'correctly parses the quote tag' do
    expect(QuoteTag).not_to be nil
    expect(BBCode.parse "[quote=Neikos]Hello[/quote]").to eq "<p>Text: Hello</p><em>User: Neikos</em>"
  end

  it 'correctly parses several tags' do
    expect(BBCode.parse "[quote=Neikos]Hello [i]Yo[/i][/quote]").to(
      eq "<p>Text: Hello <em>Yo</em></p><em>User: Neikos</em>"
    )
  end
end
