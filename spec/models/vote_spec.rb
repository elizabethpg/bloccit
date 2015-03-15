describe Vote do
  describe "validations" do
    it { should validate_inclusion_of(:vote).in([1, -1]) }

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(up_vote.valid?).to eq(1)
        expect(down_vote.valid?)to eq(-1)
      end
    end
  end
end

# This model will feature an inclusion validation. 
# Inclusion validation ensures that a vote's value attribute is either 1 or -1. 
# If a vote is initialized with any other value, it will not save.