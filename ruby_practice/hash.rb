months = Hash.new "month"
month = Hash.new
puts months[1]
puts month[1] == nil

H = Hash["a" => 100, "b" => 200]
puts H["a"] , "#{H['b']}"

a = Array.new(1,"2") + Array.new(1,"feb")
puts Hash[a => "February"]
a = Array[1, "jan"]
H1 = Hash[a => "January"]
puts "#{H1}"
puts "#{H1.merge(H)}"
