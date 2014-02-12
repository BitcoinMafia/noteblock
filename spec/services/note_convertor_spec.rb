require 'spec_helper'

describe NoteConvertor do

  let(:note) { "I love you baby 4eva and eva" }
  let(:note2) {
    "To Jennifer Lawrence, please write me back so we "\
    "can run away and start a family together"
  }

  let(:note_hex_array) {
    [
      "4c4f564549206c6f766520796f75206261627920",
      "3465766120616e64206576610000000000000000",
    ]
  }

  let(:note_hex_array2) {
    [
      "4c4f5645546f204a656e6e69666572204c617772",
      "656e63652c20706c65617365207772697465206d",
      "65206261636b20736f2077652063616e2072756e",
      "206177617920616e642073746172742061206661",
      "6d696c7920746f67657468657200000000000000"
    ]
  }

  let(:note_hex_array_invalid) {
    [
      "3c4f564549206c6f766520796f75206261627920",
      "3465766120616e64206576610000000000000000",
    ]
  }

  let(:note_long)   {
    "I love you baby 4eva and eva I love you baby 4eva and eva"\
    "I love you baby 4eva and eva I love you baby 4eva and eva"\
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

  it "should convert note2 to array of hexes2" do
    hex_array = NoteConvertor.utf8_to_hex(note2)
    expect(hex_array).to eq(note_hex_array2)
  end

  it "should convert note2 to array of hexes2" do
    result2 = NoteConvertor.hex_to_utf8(note_hex_array2)
    expect(result2).to eq(note2)
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

  it "should return error if > 136 characters" do
    expect {
      NoteConvertor.utf8_to_hex(note_long)
    }.to raise_error(RuntimeError, /length/)
  end
end
