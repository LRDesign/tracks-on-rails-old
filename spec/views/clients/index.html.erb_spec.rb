require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/index.html.erb" do
  include ClientsHelper
  
  before(:each) do
    assigns[:clients] = [
      stub_model(Client,
        :name => "value for name",
        :billing_email => "value for billing_email",
        :address_1 => "value for address_1",
        :address_2 => "value for address_2",
        :city => "value for city",
        :state => "value for state"
      ),
      stub_model(Client,
        :name => "value for name",
        :billing_email => "value for billing_email",
        :address_1 => "value for address_1",
        :address_2 => "value for address_2",
        :city => "value for city",
        :state => "value for state"
      )
    ]
    render "/clients/index.html.erb"
  end

  it "should render list of clients" do
    response.should have_tag("tr>td", "value for name", 2)
  end
    
  it "should have list table" do
     response.should have_tag("table.listing")
   end

   it "should have even and odd rows" do
     response.should have_tag("tr.odd", 1)
     response.should have_tag("tr.even", 1)
   end
  
end

