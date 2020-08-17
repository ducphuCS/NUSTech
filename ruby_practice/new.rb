class A
  def a
    puts "this is a"
  end
end
class B < A
  def a
    puts "this is b"
  end
end

obj = B.new
obj.a
