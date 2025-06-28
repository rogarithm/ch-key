require_relative "./key_finder"
require_relative "./key"

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
    chords.each do |chord|
      root, rest = slice_root(chord)
      result << find_transposed(root, step, sig) + rest
    end
    result
  end

  def slice_root(chord)
    return [chord, ""] if chord.size == 1
    return [chord[0..1], chord[1..]] if chord[1] == "#" or chord[1] == "b"
    [chord[0], chord[1..]]
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
