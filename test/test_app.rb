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
		ARGV.clear
		assert_equal 0, ARGV.size
	end

	def test_create_app_directories
		app = App.new
		ARGV[0] = "create"
		ARGV[1] = "test"
		app.proccess_arguments
		assert_equal true, Dir.exist?(ARGV[1])
		assert_equal true, Dir.exist?("test/models")
		assert_equal true, Dir.exist?("test/controllers")
		assert_equal true, Dir.exist?("test/views")
		assert_equal true, Dir.exist?("test/db")
		assert_equal true, Dir.exist?("test/db/migrate")
	end

	def test_create_app_files
		assert_equal true, File.exist?("test/app.rb")
		assert_equal true, File.exist?("test/Gemfile")
		assert_equal true, File.exist?("test/rakefile.rb")
		assert_equal true, File.exist?("test/db/connection.rb")
		assert_equal true, File.exist?("test/views/index.erb")
	end

end