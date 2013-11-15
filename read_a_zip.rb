require './features/support/env.rb'

# command line arguments of project name and zip file archive name.

project_loader = Project_Loader.new ARGV[0], ARGV[1]
project_loader.process
