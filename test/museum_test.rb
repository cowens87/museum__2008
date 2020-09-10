require "minitest/autorun"
require "minitest/pride"
require "./lib/exhibit"
require "./lib/patron"
require "./lib/museum"
require "pry";

class MuseumTest < Minitest::Test
  # Iteration 2
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

  def test_patron_has_interests
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)

    patron_1.add_interest("Dead Sea Scrolls")

    patron_1.add_interest("Gems and Minerals")

    patron_2.add_interest("IMAX")

    # For the recommend_exhibits method, the Museum should recommend exhibits
    # that match a Patron's interests.
    dmns.recommend_exhibits(patron_1)
    #recommends gems_and_minerals and dead_sea_scrolls

    dmns.recommend_exhibits(patron_2)
    #recommends imax
  end

    # Iteration 3
    # **ticket_lottery_contestants** returns an array of patrons that do not have
    # enough money to see an exhibit, but are interested in that exhibit.
    # The lottery winner is generated randomly based on the available contestants
    # when **draw_lottery_winner** is called.
    # You will need to use a stub to test the **announce_lottery_winner** method in
    # conjunction with the draw_lottery_winner method. JOY!
    def test_it_can_has_patrons
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      dmns.add_exhibit("Dead Sea Scrolls")

      dmns.add_exhibit("Gems and Minerals")

      dmns.add_exhibit("IMAX")

      assert_equal [], dmns.patrons
    end

    def test_it_patrons_are_admitted
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      patron_1 = Patron.new("Bob", 20)
      patron_2 = Patron.new("Sally", 20)
      patron_3 = Patron.new("Johnny", 5)

      patron_1.add_interest("Gems and Minerals")

      patron_1.add_interest("Dead Sea Scrolls")

      patron_2.add_interest("Dead Sea Scrolls")

      patron_3.add_interest("Dead Sea Scrolls")

      dmns.admit(patron_1)

      dmns.admit(patron_2)

      dmns.admit(patron_3)

      assert_equal [patron_1, patron_2, patron_3], dmns.patrons
    end


    def test_patrons_by_exibit
    # **For patrons_by_exhibit_interest**, this method takes no arguments and returns
    # a Hash where each key is an Exhibit. The value associated with that Exhibit
    # is an Array of all the Patrons that have an interest in that exhibit.
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      patron_1 = Patron.new("Bob", 20)
      patron_2 = Patron.new("Sally", 20)
      patron_3 = Patron.new("Johnny", 5)

      expected= {gems_and_minerals => [patron_1],
                 dead_sea_scrolls  => [patron_1, patron_2, patron_3],
                 imax              => []
                }

      dmns.add_exhibit("Dead Sea Scrolls")

        dmns.add_exhibit("Gems and Minerals")

        dmns.add_exhibit("IMAX")

        patron_1.add_interest("Gems and Minerals")

        patron_1.add_interest("Dead Sea Scrolls")

        patron_2.add_interest("Dead Sea Scrolls")

        patron_3.add_interest("Dead Sea Scrolls")

        #Patrons are added even if they don't have enough money for all/any exhibits.
        dmns.admit(patron_1)

        dmns.admit(patron_2)

        dmns.admit(patron_3)

        assert_equal expected, dmns.patrons_by_exhibit_interest
    end
end
