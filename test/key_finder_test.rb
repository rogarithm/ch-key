require "minitest/autorun"
require_relative "../lib/key_finder"

class KeyFinderTest < Minitest::Test

  def test_find_key_by_its_name
    kf = KeyFinder.new
    key_nms = [
      "C", "B#", "C#", "Db",
      "D", "D#", "Eb", "E",
      "Fb", "E#", "F", "F#",
      "Gb", "G", "G#", "Ab",
      "A", "A#", "Bb", "B", "Cb"
    ]

    key_nms.each do |key_nm|
      key = kf.find_by_nm(key_nm)
      assert_equal(key_nm, key.nm)
    end
  end

  def test_find_target_key_from_orig_key_with_step
    kf = KeyFinder.new
    assert_equal "C", kf.find_by_step(0, :natural).nm
  end

  def test_fail_to_find_key_with_step
    kf = KeyFinder.new
    err = assert_raises(StandardError) { kf.find_by_step(1, :natural) }
    assert_match(
      /fail to find key by step \d{1,2} with sig [natural|flat|sharp]/,
      err.message
    )
  end
end
