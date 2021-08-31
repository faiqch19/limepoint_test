require_relative './boxes.rb'

class Animals

  R = 20 * 20
  H = 20 * 20
  M = 40 * 20
  S = (40 * 40) - (20*20)

  def getBoxes animals
    animal_array = animals.gsub(/[[:space:]]/, '').split(',')
    result = []

    animal_array.each { |animal|
      raise ArgumentError, "Animal Data not Found" unless checkExists(animal)
    }

    boxes = Boxes.new
    return boxes.getBoxes(animal_array)
  end

  private

  def checkExists animal
    if animal == "R" || animal == "H" || animal == "M" || animal == "S"
      return true
    else
      return false
    end
  end
end