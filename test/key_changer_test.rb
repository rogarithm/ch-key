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

  def test_transpose_chords_with_more_than_root
    [
      ["CM7 FM7 G7", "C", "D", %w[DM7 GM7 A7]],
    ].each do |data|
      orig_chords, orig_key, target_key, expected = data
      assert_equal(
        expected,
        KeyChanger.new.transpose(orig_chords, orig_key, target_key)
      )
    end
  end

  def test_transpose_chords_with_only_root
    [
      ["C F G", "C", "D", %w[D G A]],
    ].each do |data|
      orig_chords, orig_key, target_key, expected = data
      assert_equal(
        expected,
        KeyChanger.new.transpose(orig_chords, orig_key, target_key)
      )
    end

    [
      ["C F G", "C", "Bb", %w[Bb Eb F]],
    ].each do |data|
      orig_chords, orig_key, target_key, expected = data
      assert_equal(
        expected,
        KeyChanger.new.transpose(orig_chords, orig_key, target_key)
      )
    end

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
