class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(name)
    @exhibits << name
  end

  def recommend_exhibits(patron)
    patron.interests == patron.interests
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    pat_int = {} #k=exbi v= patr
  # binding.pry
  #   @patrons.each do |person|
  #     if person.interests == @exibits.name
    @exhibits.each_with_index do |exibit, index|
      pat_int[exibit] = patrons.interest[index]
  end

  def method_name

  end
end
end
