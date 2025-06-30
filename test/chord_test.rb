require "minitest/autorun"
require_relative "../lib/chord"

class ChordTest < Minitest::Test
  def test_init_chord_bass_is_root
    root,rest,bass = Chord.parse("CM7")
    c = Chord.new(root,rest,bass)
    assert_equal "C", c.root
    assert_equal "M7", c.rest
    assert_equal "C", c.bass
  end

  def test_init_chord_bass_is_not_root
    root,rest,bass = Chord.parse("CM7/E")
    c_over_e = Chord.new(root,rest,bass)
    assert_equal "C", c_over_e.root
    assert_equal "M7", c_over_e.rest
    assert_equal "E", c_over_e.bass
  end

  def test_convert_to_string
    assert_equal(
      "CM7",
      Chord.new(*Chord.parse("CM7")).to_s
    )
    assert_equal(
      "CM7/E",
      Chord.new(*Chord.parse("CM7/E")).to_s
    )
  end

  def test_parse_chord
    [
      ["CM7", %w[C M7 C]],
      ["FM7", %w[F M7 F]],
      ["G7", %w[G 7 G]],
      ["C#M7", %w[C# M7 C#]],
      ["FbM7", %w[Fb M7 Fb]],
      ["G#7", %w[G# 7 G#]],
      ["G/B", ["G", "", "B"]],
      ["CM7/B", %w[C M7 B]],
    ].each do |data|
      orig_chord, parsed = data
      assert_equal(
        parsed,
        Chord.parse(orig_chord)
      )
    end
  end
end
