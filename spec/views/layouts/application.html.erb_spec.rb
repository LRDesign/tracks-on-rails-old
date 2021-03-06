require File.dirname(__FILE__) + '/../../spec_helper'

describe "application layout" do
  fixtures :users

  before(:each) do
    @person = login_as :quentin
  end
    

  describe "layout when not logged in" do
    fixtures :users
  
  
    before(:each) do
      render "/layouts/application.html.erb"
    end

    it "should have the right DOCTYPE declaration" do
      response.body.should match(/XHTML 1.0 Transitional/)
    end
  end

  describe "layout when logged in" do
  
    before(:each) do
      render "/layouts/application.html.erb"
    end
  
    it "should have the right DOCTYPE declaration" do
       response.body.should match(/XHTML 1.0 Transitional/)
     end
  end
  
end