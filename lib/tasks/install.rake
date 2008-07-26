require 'active_record'
require 'active_record/fixtures'

desc "Install TracksOnRails"
task :install => :environment do |t|
  Rake::Task["db:migrate"].invoke
  create_admin_user
end

def create_admin_user
  password = "foobar"
  admin = User.create!(:login => "admin",
    :email => "admin@example.com",
    :password => password, 
    :password_confirmation => password,
    :name => "Admin User")
end