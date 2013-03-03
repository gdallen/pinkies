require './features/support/env.rb'

project_loader = Project_Loader.new ARGV[0], ARGV[1]
project_loader.process
