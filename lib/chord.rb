class Chord
  attr_reader :root, :rest, :bass

  def initialize(root, rest, bass=nil)
    @root, @rest= root, rest
    @bass = bass.nil? ? root : bass
  end
end
