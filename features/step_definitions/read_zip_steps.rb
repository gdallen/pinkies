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

Given /^list of files to process$/ do |table|
  # table is a Cucumber::Ast::Table
  @filenames = []
  table.hashes.map do |hash|
    @filenames << hash["filename"]
  end
end

When /^I filter the list of filenames$/ do
  parser = Filename_Parser.new
  @to_process = @filenames.select do |fn|
    puts " filename to process #{fn} ?  #{parser.should_be_processed? fn}"
    parser.should_be_processed? fn
  end
end

Then /^the list of filenames to process should include$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.map do |hash|
    filename = hash["filename"]
    @to_process.should include(filename)
  end
end

Then /^the list of filenames to process should not include$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.map do |hash|
    filename = hash["filename"]
    @to_process.should_not include(filename)
  end
end

Then /^I should find count of "(.*?)" in  "(.*?)" to be "(.*?)"$/ do |letter, filename, count_string|
  @zip_reader.count(filename, letter).should == count_string.to_i
end

