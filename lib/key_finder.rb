require_relative "./key"

class KeyFinder
  KEYS = [
    Key.new("C", 0), Key.new("B#", 0, :sharp),
    Key.new("C#", 1, :sharp), Key.new("Db", 1, :flat),
    Key.new("D", 2, :sharp),
    Key.new("D#", 3, :sharp), Key.new("Eb", 3, :flat),
    Key.new("E", 4, :sharp), Key.new("Fb", 4, :flat),
    Key.new("E#", 5, :sharp), Key.new("F", 5, :flat),
    Key.new("F#", 6, :sharp), Key.new("Gb", 6, :flat),
    Key.new("G", 7, :sharp),
    Key.new("G#", 8, :sharp), Key.new("Ab", 8, :flat),
    Key.new("A", 9, :sharp),
    Key.new("A#", 10, :sharp), Key.new("Bb", 10, :flat),
    Key.new("B", 11, :sharp), Key.new("Cb", 11, :flat)
  ]

  def find_by_nm(nm)
    KEYS.select { |k| k.nm == nm }.first
  end

  def normalize_step(step)
    step % 12
  end

  def find_by_step(step, sig)
    step = normalize_step(step)
    matching_keys = KEYS.select { |k| k.step == step }

    key_with_sig = matching_keys.find { |k| k.sig == sig }

    if key_with_sig
      return key_with_sig
    end

    fallback_key = matching_keys.find { |k| k.sig == :natural }

    if fallback_key
      fallback_key
    end

    raise StandardError.new("fail to find key by step #{step} with sig #{sig}")
  end
end
