class Favorite
  attr_reader :pets

  def initialize(initial_pets)
    @pets = initial_pets ||= Array.new
  end

  def total_count
    @pets.length
  end
end
