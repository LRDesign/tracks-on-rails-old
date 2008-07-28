require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/show.html.erb" do
  include ClientsHelper
  
  before(:each) do
    assigns[:client] = @client = stub_model(Client,
      :name => "value for name",
      :billing_email => "value for billing_email",
      :address_1 => "value for address_1",
      :address_2 => "value for address_2",
      :city => "value for city",
      :state => "value for state"
    )
  end

  it "should render attributes in <p>" do
    render "/clients/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ billing_email/)
    response.should have_text(/value\ for\ address_1/)
    response.should have_text(/value\ for\ address_2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
  end
end

