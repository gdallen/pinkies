Feature: file type feature

  when processing files, I want to only process text files and skip
  image and other binary files

Scenario: process files of known types
  Given a filename "test.txt"
  When I check if the file should be processed
  Then file should process should be "true"

Scenario: process files of unknown types
  Given a filename "test.xxx"
  When I check if the file should be processed
  Then file should process should be "false"
