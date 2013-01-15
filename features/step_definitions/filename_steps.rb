Given /^a filename "(.*?)"$/ do |filename|
  @filename = filename
end

When /^I find the filename extension$/ do
  parser = Filename_Parser.new
  @extension = parser.find_extension @filename
end

When /^I check if the file should be processed$/ do
  parser = Filename_Parser.new
  @should_process = parser.should_be_processed? @filename
end

Then /^I should see "(.*?)"$/ do |extension|
  @extension.should == extension
end

Then /^file should process should be "(.*?)"$/ do |arg1|
  @should_process.to_s.should == arg1
end

