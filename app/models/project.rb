class Project < ActiveRecord::Base
  belongs_to :client
  acts_as_tree

  before_save :set_client
  
  protected
  def set_client
    self.client = parent.client unless parent.nil?
  end
  
end
