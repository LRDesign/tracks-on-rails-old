require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :billing_email => "value for billing_email",
      :address_1 => "value for address_1",
      :address_2 => "value for address_2",
      :city => "value for city",
      :state => "value for state",
      :default_project_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Client.create!(@valid_attributes)
  end
end
