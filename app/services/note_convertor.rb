module NoteConvertor
  extend self

  MAGIC_BYTES = "LOVE".unpack("H*")[0]
  MAX_LENGTH = 140

  def utf8_to_hex(note)
    raise "Note length must be <= 136" if note.length > 136

    initial_hex = MAGIC_BYTES + note.unpack("H*")[0]
    extra_length = MAX_LENGTH - initial_hex.length / 2
    final_hex = initial_hex + ("00" * extra_length)

    hex_array = final_hex.scan(/.{40}/)

    hex_array = self.strip(hex_array)

    return hex_array
  end

  def hex_to_utf8(hexArr)
    raise "Input must be array" unless hexArr.is_a?(Array)
    raise "Does not contain magic bytes" if hexArr[0][0..7] != MAGIC_BYTES

    hexArr = strip(hexArr)

    full_hex = hexArr.join
    stripped_hex = full_hex[8..-1]

    return [stripped_hex].pack("H*").strip
  end

  def strip(array)
    array.map { |a|
      a unless a == "0000000000000000000000000000000000000000"
    }.compact
  end
end
