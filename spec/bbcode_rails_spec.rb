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

  it 'correctly parses the user tag with quotes' do
    expect(UserTag).not_to be nil
    expect(BBCode.parse "[user=\"Neikos\"]").to eq "<p>Name: Neikos</p>"
  end

  it 'doesnt care about invalid tag nesting' do
    expect(ITag).not_to be nil
    expect(BTag).not_to be nil

    expect(BBCode.parse "Hello [i][b]Neikos[/i][/b]").to eq "Hello [i][b]Neikos[/i][/b]"
  end

  it 'doesnt parse unknown tags' do
    expect(BBCode.parse "[what]'s [/up]").to eq "[what]&apos;s [/up]"
  end

  it 'doesnt error out when closing inexisting tags' do
    expect(BTag).not_to be nil
    expect(BBCode.parse "Hey [b] W [/fg] [/b] asd").to eq "Hey <strong> W [/fg] </strong> asd"
  end

  it 'should reraise errors if one chooses so' do
    expect(BTag).not_to be nil
    expect{BBCode.parse "Heya [b=Neikos]", true}.to raise_error(BBCode::ParseError)
  end

  it 'should correctly escape html tags' do
    expect(BBCode.parse "<script>alert('Stealing your data...')</script>").to(
     eq "&lt;script&gt;alert(&apos;Stealing your data...&apos;)&lt;/script&gt;"
   )
  end

  it 'should correctly add newlines' do
    expect(BBCode.parse "\r\n \n\n").to eq "<br> <br><br>"
  end
end
