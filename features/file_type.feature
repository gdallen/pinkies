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

Scenario: filtering list of files
  Given list of files to process
    | filename |
    | test1.txt |
    | test2.txt |
    | skip.jpg  |
    | test.xml  |
  When I filter the list of filenames
  Then the list of filenames to process should include
    | filename |
    | test1.txt |
    | test2.txt |
    | test.xml  |
  And the list of filenames to process should not include
    | filename |
    | skip.jpg |

    
