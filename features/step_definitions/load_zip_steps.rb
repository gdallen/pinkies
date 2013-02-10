Given /^a project called "(.*?)" and an archive called "(.*?)"$/ do |project, archive|
  @archive_file_name = archive
  @project_name = project
end

When /^the utility is started with the command line parameters$/ do
  @project_loader = Project_Loader.new @project_name, @archive_file_name
end

When /^the archive has been read$/ do
  @project_loader.process
end

Then /^a project called "(.*?)" should be in the database$/ do |arg1|
  @db_project =   @project_loader.read arg1
  @db_project.should_not be_nil
end

Then /^the archive should be "(.*?)"$/ do |arg1|
  @db_project.archive_name.should == arg1
end

Then /^the project should have a file called "(.*?)"$/ do |arg1|
  @db_project.files.should include(arg1)
end

Then /^the project should have a file called 'file(\d+)\.txt'$/ do |arg1|
  @db_project.files.should include(arg1)
end

Then /^the file "(.*?)" should be in the database for project "(.*?)"$/ do |filename, project|
  
  @db_project = Project_Loader.new project, ""
  @file_list = @db_project.files
  @file_list.should include(filename)
end

Then /^the file "(.*?)" in project "(.*?)" should have character counts$/ do |filename, project, table|
  # table is a Cucumber::Ast::Table
  charcount = @db_project.counts filename
  table.hashes.map do |hash|
    chr = hash["character"]
    count = hash["count"].to_i
    charcount[chr].should == count
  end
end

