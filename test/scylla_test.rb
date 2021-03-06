require 'helper'

class ScyllaTest < Minitest::Test
  context "String methods" do
    setup do
      Scylla::Loader.set_dir(File.join("test","fixtures","lms"))
      text = "Hello? Is there anybody in there?"
      @language = text.language
      @languages = text.guess_language
      @locale = text.locale
      @locales = text.guess_locale
    end

    should "load language results for strings" do
      assert @language
      assert @languages
      assert_equal String, @language.class
      assert_equal Array, @languages.class
      assert_equal "english", @language
      assert_equal "english", @languages.first
      assert_equal "en", @locale
      assert_equal "en", @locales.first
    end
  end
end
