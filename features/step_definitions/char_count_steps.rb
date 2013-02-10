Given /^a text line "(.*?)"$/ do |arg1|
  @text_line = arg1
end

Given /^a second text line "(.*?)"$/ do |arg1|
  @second_line = arg1
end

When /^I count the line of text$/ do
  @char_counter = Char_Counter.new
  @char_counter.count_characters @text_line
end

When /^I count the second line of text$/ do
  @char_counter.count_characters @second_line
end

Then /^I should find$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.map do |hash|
    letter = hash["letter"]
    if letter =~ /:/
      letter = letter[1..-1].to_sym
    end
    expected_count = hash["count"]
    count = @char_counter.count letter
    count.should == expected_count.to_i
  end
end

Then /^I should find total "(.*?)" total letters$/ do |arg1|
  @char_counter.total_characters.should == arg1.to_i
end

