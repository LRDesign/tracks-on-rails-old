require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/index.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:projects] = [
      stub_model(Project,
        :name => "value for name",
        :account => "value for account",
        :description => "value for description"
      ),
      stub_model(Project,
        :name => "value for name",
        :account => "value for account",
        :description => "value for description"
      )
    ]
    render "/projects/index.html.erb"
  end

  it "should render list of projects" do
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
  end
  
  it "should have list table" do
    response.should have_tag("table.listing")
  end
  
  it "should have even and odd rows" do
    response.should have_tag("tr.odd", 1)
    response.should have_tag("tr.even", 1)
  end
      
end

