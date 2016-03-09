##
# Writing to file
#
File.open("act15.json","w") do |f|
  f.write(JSON.pretty_generate(array))
end


##
# Appending to File
#
File.open('act15.json', 'a') { |f|
  f.puts(JSON.pretty_generate(array))
end

##
# Reading file
#
File.open('xxx.txt').read
