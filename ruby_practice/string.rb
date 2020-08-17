# create new String object
  #public Class method
new_str = String::new("Hello Ruby")
other_str = "Hello Ruby"
str = String.try_convert(/re/)
puts new_str
puts other_str
puts str
  #public instance method
    #str % arg
puts "%05d" % 123
puts "foo = %{foo}" % { :foo => 'bar'}
    #str * integer
puts "Ho! " * 0, "Ho! " * 3
puts "Hello from " + self.to_s #operator +
a = "hello "; a << "World"; puts a
puts "hello\r\n\n\n\n\n\r".chomp.chomp.chomp.chomp.chomp
puts "hello".codepoints
puts %x!ls!
