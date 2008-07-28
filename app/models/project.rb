class Project < ActiveRecord::Base
  belongs_to :client
  acts_as_tree

end
