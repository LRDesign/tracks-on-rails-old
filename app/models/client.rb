class Client < ActiveRecord::Base
  has_many :projects 
  
  before_create :create_root_project
    
  # return the root ancestor of this client's project tree
  def root_project
    self.projects.first.root
  end
  
  protected
  def create_root_project
    self.projects << Project.new(:name => self.name)
  end
    
end
