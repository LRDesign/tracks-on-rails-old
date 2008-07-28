require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/new.html.erb" do
  include ClientsHelper
  
  before(:each) do
    assigns[:client] = stub_model(Client,
      :new_record? => true,
      :name => "value for name",
      :billing_email => "value for billing_email",
      :address_1 => "value for address_1",
      :address_2 => "value for address_2",
      :city => "value for city",
      :state => "value for state"
    )
  end

  it "should render new form" do
    render "/clients/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", clients_path) do
      with_tag("input#client_name[name=?]", "client[name]")
      with_tag("input#client_billing_email[name=?]", "client[billing_email]")
      with_tag("input#client_address_1[name=?]", "client[address_1]")
      with_tag("input#client_address_2[name=?]", "client[address_2]")
      with_tag("input#client_city[name=?]", "client[city]")
      with_tag("input#client_state[name=?]", "client[state]")
    end
  end
end


