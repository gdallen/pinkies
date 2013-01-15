 
class Char_Counter

  def initialize
    @charmap = {}
    @total_characters = 0
  end

  def count_characters l
    l.each_char do |char|
      label = get_label char
      @total_characters += 1
      @charmap[label] = 1 + (@charmap[label] || 0)
    end
  end
  
  def count c
    @charmap[c] || 0
  end
  
  def total_characters
    @total_characters
  end

  private
  
  def get_label c
    if c == " "
      :space
    else
      c
    end
  end
end
