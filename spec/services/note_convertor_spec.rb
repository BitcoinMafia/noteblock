require 'spec_helper'

describe NoteConvertor do

  let(:note) { "I love you baby 4eva and eva" }

  let(:note_hex_array) {
    [
      "4c4f564549206c6f766520796f75206261627920",
      "3465766120616e64206576612020202020202020",
      "2020202020202020202020202020202020202020",
      "2020202020202020202020202020202020202020"
    ]
  }

  let(:note_hex_array_invalid) {
    [
      "3c4f564549206c6f766520796f75206261627920",
      "3465766120616e64206576612020202020202020",
      "2020202020202020202020202020202020202020",
      "2020202020202020202020202020202020202020"
    ]
  }

  let(:note_long)   {
    "I love you baby 4eva and eva I love you baby 4eva and eva"\
    "I love you baby 4eva and eva I love you baby 4eva and eva"
  }

  it "should convert note to array of hexes" do
    hex_array = NoteConvertor.utf8_to_hex(note)
    expect(hex_array).to eq(note_hex_array)
  end

  it "should convert array of hexes to note" do
    result = NoteConvertor.hex_to_utf8(note_hex_array)
    expect(result).to eq(note)
  end

  it "should return error if not hexArray" do
    expect {
      NoteConvertor.hex_to_utf8(note_hex_array.join)
    }.to raise_error(RuntimeError, /array/)
  end

  it "should return error if no magic bytes" do
    expect {
      NoteConvertor.hex_to_utf8(note_hex_array_invalid)
    }.to raise_error(RuntimeError, /magic/)
  end

  it "should return error if > 76 characters" do
    expect {
      NoteConvertor.utf8_to_hex(note_long)
    }.to raise_error(RuntimeError, /length/)
  end
end
