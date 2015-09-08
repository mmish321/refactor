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

end
