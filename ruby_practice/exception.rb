filename = "glulu.rb"
begin
  file = open(filename)
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
  filename = "loop.rb"
  retry
else
  puts "File opened successfully"
ensure
  print file, "==", STDIN, "\n"
end

def promptAndGet(prompt)
  print prompt
  res = readline.chomp
  throw :quitRequested if res == "!"
  return res
end
promptAndGet("Name 1:")
catch :quitRequested do
  name = promptAndGet("Name: ")
  age = promptAndGet("Age: ")
  sex = promptAndGet("Sex: ")
end
