require "minitest/autorun"
require_relative "../lib/runner"

class RunnerTest < Minitest::Test
  def test_run
    r = Runner.new
    txt_sheet = "this is lyrics\n\nCM7   Em7  Dm7"
    transposed = r.run(txt_sheet, "C", "D")
    assert_equal(
      "this is lyrics\n\nDM7   F#m7  Em7",
      transposed
    )
  end

  def test_check_a_line_is_lyrics
    r = Runner.new
    assert_equal true, r.lyrics?("this is lyrics")
    assert_equal false, r.lyrics?("CM7   Em7  Dm7")
  end
end
