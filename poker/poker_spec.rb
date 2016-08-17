require './poker'

RSpec.describe Poker,"positive tests" do
  it "returns A when first hand is flush and the other is not" do
    p = Poker.new("2H 3H 4H 5H 6H", "2H 3S 4S 4C 4D")
    expect(p.compare!).to eql("A")
  end

  it "returns B when first is not flush and second has three-of-a-kind" do
    p = Poker.new("2H 3S 4S 5H 6H", "2H 2S 2S 4C 4D")
    expect(p.compare!).to eql("B")
  end

  it "returns A when first hand has 2 cards of same rank" do 
    p = Poker.new("AH 8D 4C AH 6S", "2H 3S 6S 4C 7D")
    expect(p.compare!).to eql("A")
  end

  it "returns A when first hand has high card and second is not flush or three-of-a-kind or two-of-a-kind" do 
    p = Poker.new("AH 8D 4C 10H 6S", "2H 3S 6S 4C 7D")
    expect(p.compare!).to eql("A")
  end

  it "returns Tie when high cards of both hands are the same" do
    p = Poker.new("AH 8D 4C 10H 6S", "AH 3S 6S 4C 7D")
    # puts p.compare!
    expect(p.compare!).to eql("Tie")
  end    
end