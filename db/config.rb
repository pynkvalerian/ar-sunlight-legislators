require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-sunlight-legislators.sqlite3")

# config.autoload_paths += %W(#{config.root}/app/models/congress_members.rb)