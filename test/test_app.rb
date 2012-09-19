require 'test/unit'
require_relative '../bin/app.rb'

class AppTest < Test::Unit::TestCase
	def test_empty_app_name
		app = App.new
		assert_equal nil, app.name
	end

	def test_empty_app_root
		app = App.new
		assert_equal nil, app.root
	end

	def test_no_arguments_passed
		app = App.new
		assert_equal 0, ARGV.size
	end
end