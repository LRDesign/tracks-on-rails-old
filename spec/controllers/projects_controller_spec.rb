require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectsController do
  fixtures :projects, :users
  
  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
    @mock_project.stub!(:client).and_return(@mock_client)
    @mock_project
  end
  
  def mock_client(stubs={})
    @mock_client ||= mock_model(Client, stubs)
    @mock_client
  end
  
  describe "when logged in" do
    before(:each) do
      login_as(:quentin)
    end
      
    describe "responding to GET index" do

      it "should expose all projects as @projects" do
        Project.should_receive(:find).with(:all).and_return([mock_project])
        get :index
        assigns[:projects].should == [mock_project]
      end
    
      it "should expose client as @client when called in a nested fashion" do
        Client.should_receive(:find_by_id).with("5").and_return(mock_client)
        #mock_client.stub!(:projects).and_return(mock("Array of Projects"))
        mock_client.should_receive(:projects).and_return(projects = mock("Array of Projects"))
        get :index, :client_id => 5
        assigns[:client].should == mock_client
      end
    

      describe "with mime type of xml" do
  
        it "should render all projects as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          Project.should_receive(:find).with(:all).and_return(projects = mock("Array of Projects"))
          projects.should_receive(:to_xml).and_return("generated XML")
          get :index
          response.body.should == "generated XML"
        end
    
      end

    end

    describe "responding to GET show" do

      it "should expose the requested project as @project" do
        Project.should_receive(:find).with("37").and_return(mock_project)
        get :show, :id => "37"
        assigns[:project].should equal(mock_project)
      end
    
      describe "with mime type of xml" do

        it "should render the requested project as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          Project.should_receive(:find).with("37").and_return(mock_project)
          mock_project.should_receive(:to_xml).and_return("generated XML")
          get :show, :id => "37"
          response.body.should == "generated XML"
        end

      end
    
    end

    describe "responding to GET new" do
  
      it "should expose a new project as @project" do
        Project.should_receive(:new).and_return(mock_project)
        get :new
        assigns[:project].should equal(mock_project)
      end

    end

    describe "responding to GET edit" do
  
      it "should expose the requested project as @project" do
        Project.should_receive(:find).with("37").and_return(mock_project)
        get :edit, :id => "37"
        assigns[:project].should equal(mock_project)
      end

    end

    describe "responding to POST create" do

      describe "with valid params" do
      
        it "should expose a newly created project as @project" do
          Project.should_receive(:new).with({'these' => 'params'}).and_return(mock_project(:save => true))
          post :create, :project => {:these => 'params'}
          assigns(:project).should equal(mock_project)
        end

        it "should redirect to the created project" do
          Project.stub!(:new).and_return(mock_project(:save => true))
          post :create, :project => {}
          response.should redirect_to(project_url(mock_project))
        end
      
      end
    
      describe "with invalid params" do

        it "should expose a newly created but unsaved project as @project" do
          Project.stub!(:new).with({'these' => 'params'}).and_return(mock_project(:save => false))
          post :create, :project => {:these => 'params'}
          assigns(:project).should equal(mock_project)
        end

        it "should re-render the 'new' template" do
          Project.stub!(:new).and_return(mock_project(:save => false))
          post :create, :project => {}
          response.should render_template('new')
        end
      
      end
    
    end

    describe "responding to PUT udpate" do

      describe "with valid params" do

        it "should update the requested project" do
          Project.should_receive(:find).with("37").and_return(mock_project)
          mock_project.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :project => {:these => 'params'}
        end

        it "should expose the requested project as @project" do
          Project.stub!(:find).and_return(mock_project(:update_attributes => true))
          put :update, :id => "1"
          assigns(:project).should equal(mock_project)
        end

        it "should redirect to the project" do
          Project.stub!(:find).and_return(mock_project(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(project_url(mock_project))
        end

      end
    
      describe "with invalid params" do

        it "should update the requested project" do
          Project.should_receive(:find).with("37").and_return(mock_project)
          mock_project.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :project => {:these => 'params'}
        end

        it "should expose the project as @project" do
          Project.stub!(:find).and_return(mock_project(:update_attributes => false))
          put :update, :id => "1"
          assigns(:project).should equal(mock_project)
        end

        it "should re-render the 'edit' template" do
          Project.stub!(:find).and_return(mock_project(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end

      end

    end

    describe "responding to DELETE destroy" do

      it "should destroy the requested project" do
        Project.should_receive(:find).with("37").and_return(mock_project)
        mock_project.should_receive(:root?).and_return(false)      
        mock_project.should_receive(:destroy)
        delete :destroy, :id => "37"
      end
  
      it "should not destroy a root project" do
        Project.should_receive(:find).with("37").and_return(mock_project)
        mock_project.should_receive(:root?).and_return(true)
        mock_project.should_not_receive(:destroy)
        delete :destroy, :id => "37"
      end  
  
      it "should redirect to the projects list" do
        Project.stub!(:find).and_return(mock_project(:destroy => true))
        mock_project.stub!(:root?).and_return(false)
        delete :destroy, :id => "1"
        response.should redirect_to(projects_url)
      end

    end
    
  end

  describe "when not logged in" do
    it "should redirect GET index to login" do
      get :index
      response.should redirect_to login_url
    end
    
    it "should redirect GET new to login" do
      get :new
      response.should redirect_to login_url
    end
    
  end
  
  
end
