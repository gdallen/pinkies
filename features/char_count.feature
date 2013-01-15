Feature: counting characters in a line of text

  As a file counter, I want to process each line and count the characters
  

Scenario: simple line of text
  Given a text line "test.txt"
  When I count the line of text
  Then I should find
  |letter|count|
  | t    | 4   |
  | e    | 1   |
  | s    | 1   |
  | .    | 1   |
  | x    | 1   |
  And I should find total "8" total letters

Scenario: line with spaces
  Given a text line "test text with spaces"
  When I count the line of text
  Then I should find
  |letter|count|
  | t    | 5   |
  | :space | 3 |
  | s    | 3   |

Scenario: two lines
  Given a text line "test one"
  And a second text line "line 2"
  When I count the line of text
  And I count the second line of text
  Then I should find
  | letter | count |
  | t      |  2    |
  | e      |  3    |
  | s      |  1    |
  | :space |  2    |
  | o      |  1    |
  | n      |  2    |
  | l      |  1    |
  | i      |  1    |
  | 2      |  1    |
