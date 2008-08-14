require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/index.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:projects] = [ stub_project, stub_project ]
    render "/projects/index.html.erb"
  end


  it "should render list of projects" do
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
  end

  it "should have a project listing block" do
    response.should have_tag('div#project_listing')
  end
  
  
  it "should have list table" do
    response.should have_tag("table.listing")
  end
  
  it "should have even and odd rows" do
    response.should have_tag("tr.odd", 1)
    response.should have_tag("tr.even", 1)
  end

  private
  def stub_project
    stub_model(Project,
      :name => "value for name",
      :account => "value for account",
      :description => "value for description",
      :client => stub_model(Client, :name => "value for Client name")
    )
  end
      
end

