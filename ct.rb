
f = File.new(ARGV[0])
charmap = {}
f.each_line do |line|
  puts line
  line.each_char do |char|
    charmap[char] = 1 + (charmap[char] || 0)
  end
end

charmap.each_pair do |key, val|
  puts "character #{key} = #{val}"
end
