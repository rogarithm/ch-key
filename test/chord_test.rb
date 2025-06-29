require "minitest/autorun"
require_relative "../lib/chord"

class ChordTest < Minitest::Test
  def test_init_chord_bass_is_root
    c = Chord.new("C", "M7")
    assert_equal "C", c.root
    assert_equal "M7", c.rest
    assert_equal "C", c.bass
  end

  def test_init_chord_bass_is_not_root
    c_over_e = Chord.new("C", "M7", "E")
    assert_equal "C", c_over_e.root
    assert_equal "M7", c_over_e.rest
    assert_equal "E", c_over_e.bass
  end
end
