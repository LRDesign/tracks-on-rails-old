class Project < ActiveRecord::Base
  belongs_to :client
  acts_as_tree

  before_save :set_client
  validate :ensure_either_parent_or_client_set
  
  
  def root?
    self == root
  end
  
  protected
  def set_client
    self.client = parent.client unless parent.nil?
  end
  
  def ensure_either_parent_or_client_set
    errors.add("parent", "must be provided") unless parent_id || client_id
  end
  
end
