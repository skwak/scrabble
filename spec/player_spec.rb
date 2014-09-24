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

    describe "#highest_word_score" do
      it "returns the score of the highest scoring word" do
        player.play("bumpy")
        player.play("jumpy")
        player.play("lumpy")
        expect(player.highest_word_score).to eq 19
      end
    end

    describe "#total_score" do
      it "returns total score of all the player's words" do
        player.play("bump")
        player.play("jump")
        expect(player.total_score).to eq 25
      end
    end


  describe "#won?" do
    it "returns whether or not player has over 100 pts" do
      player.play("bump")
      player.play("jump")
      player.play("zebra")
      player.play("orchid")
      player.play("jolly")
      player.play("barter")
      player.play("octopus")
      player.play("magnificent")
      expect(player.won?).to eq true
    end

    it "returns whether or not player has over 100 pts" do
      player.play("weird")
      player.play("twitter")
      expect(player.won?).to eq false
    end
  end

  end
end
