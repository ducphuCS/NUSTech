time1 = Time.new
puts "Current time" + time1.inspect, "Current time" + Time.now.inspect, time1.zone

time = Time.new
values = time.to_a
p values

p Time.at(Time.now.to_i)

a, b, c = 10, 11, 12
a,b = b,a
puts a,b
