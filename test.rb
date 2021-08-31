require 'rspec/autorun'
require_relative './animals.rb'

describe Animals do
  animals = Animals.new

  it "should not raise error for valid animal" do
    result = animals.getBoxes("R, H, M, S")
    expect{result}.not_to raise_error
  end

  it "should raise error for invalid animal" do
    expect{animals.getBoxes("L")}.to raise_error(ArgumentError)
  end

  it "it should fit rat in box 1" do
    result = animals.getBoxes("R")
    expect(result).to eq("B1")
  end

  it "it should fit hedgehog in box 1" do
    result = animals.getBoxes("H")
    expect(result).to eq("B1")
  end

  it "it should fit mongoose in box 2" do
    result = animals.getBoxes("M")
    expect(result).to eq("B2")
  end

  it "it should fit snake in box 3" do
    result = animals.getBoxes("S")
    expect(result).to eq("B3")
  end

  it "it should fit rat and 2 hedgehogs in box 3" do
    result = animals.getBoxes("R, H, H")
    expect(result).to eq("B3")
  end

  it "it should fit a snake and a mongoose in boxes 2 and 3" do
    result = animals.getBoxes("S, M")
    expect(result).to eq("B2,B3")
  end

  it "it should fit all animals in boxes 3 and 3" do
    result = animals.getBoxes("S, H, R, M")
    expect(result).to eq("B3,B3")
  end

  it "it should fit a rat, a hedgehog and a snake in boxes 1 and 3" do
    result = animals.getBoxes("R, H, S")
    expect(result).to eq("B1,B3")
  end
end