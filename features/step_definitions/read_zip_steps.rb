Given /^zip file "(.*?)"$/ do |zip_filename|
  @zip_reader = Zip_Reader.new zip_filename
end

When /^the zip file is read$/ do
  @zip_reader.read_files
end

Then /^I should find file "(.*?)"$/ do |filename|
  @zip_reader.filenames.include? filename
end

Then /^I should find (\d+) files inside the zip$/ do |arg1|
  @zip_reader.filenames.size.should == arg1.to_i
end

