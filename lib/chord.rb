class Chord
  attr_reader :root, :rest, :bass

  def initialize(root, rest, bass=nil)
    @root, @rest= root, rest
    @bass = bass.nil? ? root : bass
  end

  def self.parse(s)
    return [s, "", s] if s.size == 1
    other_bass = "/"
    if s.include? other_bass
      bass_at = s.index(other_bass)
      return [s[0..1], s[2...bass_at], s[bass_at+1..]] if s[1] == "#" or s[1] == "b"
      return [s[0], s[1...bass_at], s[bass_at+1..]]
    end
    return [s[0..1], s[2..], s[0..1]] if s[1] == "#" or s[1] == "b"
    [s[0], s[1..], s[0]]
  end

  def to_s
    return root + rest if bass==root
    root + rest + "/" + bass
  end
end
