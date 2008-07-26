require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/home/about" do
  before(:each) do
    render 'home/about'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should have " do
    response.should have_tag('p', %r[Lorem ipsum])
  end
end
