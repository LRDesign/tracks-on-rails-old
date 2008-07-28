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
        :state => "value for state",
      ),
      stub_model(Client,
        :name => "value for name",
        :billing_email => "value for billing_email",
        :address_1 => "value for address_1",
        :address_2 => "value for address_2",
        :city => "value for city",
        :state => "value for state",
      )
    ]
  end

  it "should render list of clients" do
    render "/clients/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for billing_email", 2)
    response.should have_tag("tr>td", "value for address_1", 2)
    response.should have_tag("tr>td", "value for address_2", 2)
    response.should have_tag("tr>td", "value for city", 2)
    response.should have_tag("tr>td", "value for state", 2)
  end
end

