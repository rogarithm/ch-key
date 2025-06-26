require "minitest/autorun"
require_relative "../lib/key_changer"

class KeyChangerTest < Minitest::Test

  def test_comp_steps_between_two_keys
    [
      ["C#", "Db", 0], ["E", "F", 1], ["C", "D", 2]
    ].each do |data|
      from, to, expected = data
      assert_equal(expected, KeyChanger.new.comp_steps(from, to))
    end
  end

  def test_transpose_with_no_sig
    [
      ["C F G", "C", "D", %w[D G A]],
    ].each do |data|
      orig_chords, orig_key, target_key, expected = data
      assert_equal(
        expected,
        KeyChanger.new.transpose(orig_chords, orig_key, target_key)
      )
    end
  end

  def test_transpose_with_flat_sig
    [
      ["C F G", "C", "Bb", %w[Bb Eb F]],
    ].each do |data|
      orig_chords, orig_key, target_key, expected = data
      assert_equal(
        expected,
        KeyChanger.new.transpose(orig_chords, orig_key, target_key)
      )
    end
  end

  def test_transpose_with_sharp_sig
    [
      ["C D E", "C", "E", %w[E F# G#]],
    ].each do |data|
      orig_chords, orig_key, target_key, expected = data
      assert_equal(
        expected,
        KeyChanger.new.transpose(orig_chords, orig_key, target_key)
      )
    end
  end
end
