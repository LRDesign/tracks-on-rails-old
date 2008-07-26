require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')


describe "/home/index when logged in" do
  fixtures        :users
  
  before(:each) do
    login_as :quentin
    render 'home/index'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[You are logged in.])
  end
  
  it "should link to logout page" do
    response.should have_tag("a[href=?]", logout_path)
  end  
  
end

describe "/home/index when logged out" do
  fixtures        :users  
  before(:each) do
    render 'home/index'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should say you are logged out" do
    response.should have_tag('p', %r[You are not logged in.])
  end

  it "should link to logout action" do
    response.should have_tag("a[href=?]", login_path)
  end
end
