require './player'

describe Player do
  describe "instance methods" do
    describe "#name" do
      it "returns name" do
        expect(Player.new("skwak").name).to eq "skwak"
      end
    end
  end
end
