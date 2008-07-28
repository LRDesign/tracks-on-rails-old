require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  before(:each) do
    @valid_attributes = {
      :parent_id => "1",
      :client_id => "1",
      :name => "value for name",
      :account => "value for account",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
  end
end
