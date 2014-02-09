require 'spec_helper'

describe NoteConvertor do

  let(:note)   {"I love you baby 4eva and eva"}
  let(:note_long)   {
    "I love you baby 4eva and eva I love you baby 4eva and eva"\
    "I love you baby 4eva and eva I love you baby 4eva and eva"
  }

  it "should return array of hexes" do
    hex_array = NoteConvertor.utf8_to_hex(note)
    expect(hex_array).to eq(
      [
        "4c4f564549206c6f766520796f75206261627920",
        "3465766120616e64206576612020202020202020",
        "2020202020202020202020202020202020202020",
        "2020202020202020202020202020202020202020"
      ]
    )
  end

  it "should return error if > 76 characters" do
    expect {
      NoteConvertor.utf8_to_hex(note_long)
    }.to raise_error(RuntimeError, /length/)
  end
end
