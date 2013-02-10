$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'Filename_Parser'
require 'Char_Counter'
require 'Zip_Reader'
require 'Project_Loader'

require 'rubygems'
require 'active_record'
require 'activerecord-mysql-adapter'

$LOAD_PATH << File.expand_path('../../../app/models', __FILE__)
require 'project'
require 'datafile'
require 'character'



ActiveRecord::Base.establish_connection(
  :adapter => 'mysql2',
  :database => 'charcount_development',
  :username => 'root',
  :password => 'pwMysql',
  :host => 'localhost' )
