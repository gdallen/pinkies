Feature: parse file name

  In order to process a file, I want to find the extension

Scenario: simple three character file extension
  Given a filename "test.txt"
  When I find the filename extension
  Then I should see "txt"

Scenario: filename with an extra dot 
  Given a filename "test.withDot.ext"
  When I find the filename extension
  Then I should see "ext"

Scenario: filename without an extension
  Given a filename "NoExtension"
  When I find the filename extension
  Then I should see ""

