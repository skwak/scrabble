require './scrabble'

describe Scrabble do

  describe "class method" do
    describe ".score" do
      it "returns sum of the letter values" do
        expect(Scrabble.score("canteen")).to eq 9
      end
    end

    describe ".highest_score_from(array_of_words)" do
      it "returns word with highest score" do
        expect(Scrabble.highest_score_from(["test", "zebra", "boo", "hambone", "tag", "zpp", "jx"])).to eq "jx"
      end
    end

    describe ".tied_score" do
      it "returns the shorter word in a tie" do
        expect(Scrabble.tied_score("test", "tag")).to eq "tag"
      end
    end

    describe ".bonus_seven" do
      it "returns word with highest score that is 7 letters long" do
        expect(Scrabble.bonus_seven("hambone", "jaded")).to eq "hambone"
      end
    end

    describe ".word_array" do
      it "returns word as an array" do
        expect(Scrabble.word_array("TEST")).to eq ["t", "e", "s", "t"]
      end
    end

    describe ".array_of_values" do

      context "when letters in a word are 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r',
      's', 't'" do
        it "returns array of number 1" do
          expect(Scrabble.array_of_values("TEST")).to eq [1,1,1,1]
        end
      end

      context "when letters in a word are 'd', 'g'" do
        it "returns array of number 2" do
          expect(Scrabble.array_of_values("dg")).to eq [2,2]
        end
      end

      context "when letters in a word are 'b', 'c', 'm', 'p'" do
        it "returns array of number 3" do
          expect(Scrabble.array_of_values("bcmp")).to eq [3,3,3,3]
        end
      end

      context "when letters in a word are 'f', 'h', 'v', 'w', 'y'" do
        it "returns array of number 4" do
          expect(Scrabble.array_of_values("fhvwy")).to eq [4,4,4,4,4]
        end
      end

      context "when letters in a word are 'k'" do
        it "returns array of number 5" do
          expect(Scrabble.array_of_values("k")).to eq [5]
        end
      end

      context "when letters in a word are 'j', 'x'" do
        it "returns array of number 8" do
          expect(Scrabble.array_of_values("jx")).to eq [8,8]
        end
      end

      context "when letters in a word are 'q', 'z'" do
        it "returns array of number 10" do
          expect(Scrabble.array_of_values("qz")).to eq [10,10]
        end
      end

      context "when letters in a word have a mix of values" do
        it "returns array of different values" do
          expect(Scrabble.array_of_values("queen")).to eq [10,1,1,1,1]
        end
      end
    end
end

end
