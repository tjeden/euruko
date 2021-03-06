require 'spec_helper'

describe PresentationsController do
  
  describe "GET 'new'" do
    it "should enforce deadline" do
      user = Factory.create(:user)
      login_user(user)
      Presentation.stub(:deadline_reached? => true)
      get :new
      response.status.should == "401 Unauthorized"
    end
  end

  describe "PUT 'create'" do
    it "should enforce deadline" do
      user = Factory.create(:user)
      login_user(user)
      Presentation.stub(:deadline_reached? => true)
      put :create, :presentation => Factory.attributes_for(:presentation)
      response.status.should == "401 Unauthorized"
    end
  end
end
