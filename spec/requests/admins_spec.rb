require 'spec_helper'

describe "Admins" do
  describe "GET /admin/users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_users_path
      response.status.should be(200)
    end
  end
end
