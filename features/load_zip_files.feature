Feature: loading zip files

  Using a command line tool, I want to be able to specify a
  project name and a zip file name and have that zip file be
  processed to load all the character counts into the database.

Scenario: loading a zip file
Given a project called "feature test" and an archive called "test/test1.zip"
When the utility is started with the command line parameters
And the archive has been read
Then a project called "feature test" should be in the database
And the archive should be "test/test1.zip"
And the project should have a file called "file1.txt"
And the project should have a file called "file2.txt"
And the file "file1.txt" should be in the database for project "feature test"
And the file "file2.txt" should be in the database for project "feature test"
And the file "file1.txt" in project "feature test" should have character counts
  | character | count |
  | i         | 4     |
  | I         | 1     |
  | enter     | 2     |
