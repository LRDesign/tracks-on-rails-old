require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  fixtures :projects, :clients

  describe "being created" do
   
    it "should create a new instance given valid attributes" do
      lambda do
        create_project
      end.should change(Project, :count).by(1)
    end
    
    it "should get the parent project's client automatically" do
      proj = create_project(:client => nil, :parent => clients(:client_two).root_project)
      proj.client.should_not be_nil
      proj.client.should == clients(:client_two)
    end  
  end 


  protected
  def create_project(options = {})
    client = clients(:client_one)
    parent = client.root_project
    record = Project.new({ 
      :parent => parent,
      :client => client,
      :name => "FooBar Project",
      :account => "10A3B",
      :description => "Lorem Ipsum dolor sit amet"
      }.merge(options))
      record.save
      record
    end

  end
