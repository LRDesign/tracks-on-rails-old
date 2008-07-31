require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do

  describe "creating" do
    before(:each) do
      @valid_attributes = {
        :name => "value for name",
        :billing_email => "value for billing_email",
        :address_1 => "value for address_1",
        :address_2 => "value for address_2",
        :city => "value for city",
        :state => "value for state"
      }
    end

    it "should create a new instance given valid attributes" do
      Client.create!(@valid_attributes)
    end

    it "should create a root project for a new client" do
      client = Client.create!(@valid_attributes)
      client.root_project.should_not be_nil
      client.root_project.name.should == client.name
    end  
  end

  describe "destroying" do 
    it "should delete all projects"
  end
  
  it "should have zipcode field"

end
