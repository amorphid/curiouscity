require 'spec_helper'

describe "VotingRounds" do
  describe "GET /admin/voting_rounds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_voting_rounds_path
      response.status.should be(200)
    end
  end
end
