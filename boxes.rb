class Boxes
  B1 = 20.0 * 20.0
  B2 = 40.0 * 20.0
  B3 = 40.0 * 40.0

  def getBoxes animal_array
    result = []

    animal_array.each{ |animal|
      if animal == "S"
        result << "B3"
      elsif animal == "M"
        result << "B2"
      elsif animal == "R"
        result << "B1"
      elsif animal == "H"
        result << "B1"
      end

    }

    return parseResult(result.sort.reverse!)
  end

  private

  def parseResult result
  
    output = []
    index = 0
    same_count = 0

    while result.size > index do
      box = result[index]
      if box == "B1" && result.include?('B3') && same_count > 0
        same_count -= 1
        index += 1
      elsif box == "B1" && box == result[index+1]
        result.shift
        result[index] = "B2"
        index = 0
      elsif box == "B2" && box == result[index+1]
        result.shift
        result[index] = "B3"
        index = 0
        same_count -= 1
      elsif (box == "B1" && result[index+1] == "B2") || (box == "B2" && result[index+1] == "B1")
        result.shift
        result[index] = "B3"
        same_count += 1
      elsif box == "B1"
        output << "B1"
        index += 1
      elsif box == "B2"
        output << "B2"
        index += 1
      elsif box == "B3"
        output << "B3"
        index += 1
        same_count += 1
      end

    end
    output.sort!
    return output.join(',')
  end

end