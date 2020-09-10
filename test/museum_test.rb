require "minitest/autorun"
require "minitest/pride"
require "./lib/exhibit"
require "./lib/patron"
require "./lib/museum"
require "pry";

class MuseumTest < Minitest::Test
  # Iteration 2
  # For the recommend_exhibits method, the Museum should recommend exhibits
  # that match a Patron's interests.
  def test_it_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Museum, dmns
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end
end
