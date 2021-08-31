require_relative './animals.rb'

begin
  puts "Enter animals name(R,H,M,S): "
  input = gets.chomp
  animals = Animals.new
  puts "\nRequired Boxes: #{animals.getBoxes(input)}"
rescue => e
  puts "#{e.message}"
end