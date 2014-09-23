require './player'

describe Player do
  describe "instance method" do
    let(:player) { Player.new("skwak") }

    describe "#name" do
      it "returns name" do
        expect(player.name).to eq "skwak"
      end
    end

    describe "#plays" do
      it "returns array" do
        expect(player.plays).to eq []
      end
    end

    describe "#play(word)" do
      it "adds word to the plays array" do
        expect(player.play("bump")).to eq ["bump"]
      end
    end

    describe "#highest_scoring_word" do
      it "returns word with the highest score" do
        player.play("bump")
        player.play("jump")
        expect(player.highest_scoring_word).to eq "jump"
      end
    end

    describe "#total_score" do
      it "returns total score of all the player's words" do
        player.play("bump")
        player.play("jump")
        expect(player.total_score).to eq 25
      end
    end


  end
end
