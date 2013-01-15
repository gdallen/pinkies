Feature: read zip file
  when reading a zip file, I should be able to get a list of the 
  files contained in the zip.

Scenario: simple zip file

Given zip file "test/test1.zip"
When the zip file is read
Then I should find file "file1.txt"
And I should find file "file2.txt"


Scenario: nested zip file

Given zip file "test/test2.zip"
When the zip file is read
Then I should find 3 files inside the zip
Then I should find file "file1.txt"
And I should find file "file2.txt"
