require_relative "./key_finder"
require_relative "./key"
require_relative "./chord"

class KeyChanger
  attr_reader :key_finder

  def initialize
    @key_finder = KeyFinder.new
  end

  def transpose(input, from, to)
    step = comp_steps(from, to)
    chords = input.split

    sig = key_finder.find_by_nm(to).sig
    result = []
    chords.each do |s_chord|
      root, rest, bass  = Chord.parse(s_chord)
      result <<
        Chord.new(
          find_transposed(root, step, sig),
          rest,
          find_transposed(bass, step, sig)
        ).to_s
    end
    result
  end

  def comp_steps(from, to)
    to_key = key_finder.find_by_nm(to)
    from_key = key_finder.find_by_nm(from)
    to_key.step - from_key.step
  end

  def find_transposed(chord, step, sig)
    new_step = key_finder.find_by_nm(chord).step + step
    key_finder.find_by_step(new_step, sig).nm
  end
end
