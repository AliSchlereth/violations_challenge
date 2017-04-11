require 'minitest/autorun'
require 'minitest/pride'
require './lib/violations_processor'

class ViolationsTest < MiniTest::Test

  def test_does_it_run
    processor = ViolationsProcessor.new()
    processor.load_csv('Violations-2012.csv')
  end


end
