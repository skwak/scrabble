require './scrabble'

describe Scrabble do

  describe "class methods" do
    describe "#score" do

      it "responds to score" do
        expect(Scrabble).to respond_to :score
      end

      # it "returns score as a Fixnum" do
      #   expect(Scrabble.score("test")).to eq 4
      # end

    end
  end

  describe "instance methods" do

    it "responds to word_array" do
      expect(Scrabble.new("test")).to respond_to :word_array
    end

    it "returns word as an array" do
      expect(Scrabble.new("TEST").word_array).to eq ["t", "e", "s", "t"]
    end

    it "responds to word_points" do
      expect(Scrabble.new("test")).to respond_to :word_points
    end

    it "returns an array of word points" do
      expect(Scrabble.new("test").word_points).to eq [1,1,1,1]
    end

    context "when letters in a word are 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r',
    's', 't'" do
      it "returns array of number 1" do
        expect(Scrabble.new("test").word_points).to eq [1,1,1,1]
      end
    end

    context "when letters in a word are 'd', 'g'" do
      it "returns array of number 2" do
        expect(Scrabble.new("dg").word_points).to eq [2,2]
      end
    end

    context "when letters in a word are 'b', 'c', 'm', 'p'" do
      it "returns array of number 3" do
        expect(Scrabble.new("bcmp").word_points).to eq [3,3,3,3]
      end
    end

    context "when letters in a word are 'f', 'h', 'v', 'w', 'y'" do
      it "returns array of number 4" do
        expect(Scrabble.new("fhvwy").word_points).to eq [4,4,4,4,4]
      end
    end

    context "when letters in a word are 'k'" do
      it "returns array of number 5" do
        expect(Scrabble.new("k").word_points).to eq [5]
      end
    end

    context "when letters in a word are 'j', 'x'" do
      it "returns array of number 8" do
        expect(Scrabble.new("jx").word_points).to eq [8,8]
      end
    end

    context "when letters in a word are 'q', 'z'" do
      it "returns array of number 10" do
        expect(Scrabble.new("qz").word_points).to eq [10,10]
      end
    end

    context "when letters in a mix of letters" do
      it "returns array of different numbers" do
        expect(Scrabble.new("queen").word_points).to eq [10,1,1,1,1]
      end
    end

    it "responds to add_array_points" do
      expect(Scrabble.new("canteen")).to respond_to :add_array_points
    end

    it "returns sum of the letter values" do
      expect(Scrabble.new("canteen").add_array_points).to eq 9
    end
  end
end
