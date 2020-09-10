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

  def test_is_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    assert_equal [], dmns.exhibits

    dmns.add_exhibit(gems_and_minerals)

    dmns.add_exhibit(dead_sea_scrolls)

    dmns.add_exhibit(imax)

    assert_equal [gems_and_minerals, dead_sea_scrolls, imax], dmns.exhibits
  end
end
