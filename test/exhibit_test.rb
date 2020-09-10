require "minitest/autorun"
require "minitest/pride"
require "./lib/patron"
require "./lib/exhibit"
require "pry";

class ExhibitTest < Minitest::Test
  # Iteration 1
  def test_it_has_attributes
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    assert_instance_of Exhibit, exhibit
    assert_equal "Gems and Minerals", exhibit.name
    assert_equal 0, exhibit.cost
  end
end
