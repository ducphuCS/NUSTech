$i = 0
$num = 5

while $i < $num do
  puts "Inside the loop = #{$i}"
  $i += 1
end

$i = 0
begin
  puts "Inside the loop = #{$i}"
  $i += 1
end while $i < $num

i = 0
until i >= $num do
  puts "Inside the loop i = #{i}"
  i += 1
end

i = 0
begin
  puts "Inside the loop = #{i}"
  i += 1
rescue ExceptionName

end until i >= 5

for i in 0...5 do
  puts "value of local variable is #{i}"
end

(0..5).each do |i|
  if i > 3
    next
  end
  puts "value of variable is #{i}"
end

j = 0
for i in 0..5
  j += 1
  break if j > 10
  puts "value of local variable is #{i}"
  if i == 2 then
    redo
  end
end

j = 0
for i in 0..5
  begin
    j += 1
    break if j > 10
    puts "value of variable #{i} #{j}"
    raise if i == 2
  rescue
    retry
  end
end
