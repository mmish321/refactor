require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	def test_evaluate_leap_year
		assert_equal true, @m.evaluate_leap_year(1804)
		assert_equal true, @m.evaluate_leap_year(2000)
		assert_equal true, @m.evaluate_leap_year(2256)
		assert_equal false, @m.evaluate_leap_year(1800)
	end
	def test_percent_of_the_year
		assert_equal '50.0%', @m.percent_of_the_year(15768000)
		assert_equal '25.0%', @m.percent_of_the_year(7884000)

	end
	def test_convert_to_military_time
		assert_equal "15:00", @m.convert_to_military_time("3:00 pm")
		assert_equal "12:00", @m.convert_to_military_time("12:00 pm")
	end
	def test_convert_to_standard_time
		assert_equal "1:00 pm", @m.convert_to_standard_time("13:00")
		assert_equal "8:32 pm", @m.convert_to_standard_time("20:32")		
	end
	def test_bedtime
		assert_equal false , @m.bedtime?("10:00 pm", true)
		assert_equal true, @m.bedtime?("8:00 am", false)
		assert_equal false, @m.bedtime?("11:00 pm", false)

	end
	def test_percentage_of
		assert_equal '0.0%', @m.percentage_of(31536000,31536000)
		assert_equal '50.0%' , @m.percentage_of(0,15768000)

	end

end
