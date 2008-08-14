require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/show.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = @project = stub_model(Project,
      :name => "value for name",
      :account => "value for account",
      :description => "value for description",
      :client => stub_model(Client, :name => "I'm a client")
    )
  end

  it "should render attributes in <p>" do
    render "/projects/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ account/)
    response.should have_text(/value\ for\ description/)
  end
end

