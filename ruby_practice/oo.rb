class Box
  @@count = 0
  DETAIL = "box"
  def initialize(w, h)
    @width, @height = w, h
    @@count += 1
  end
  def setWidth=(value)
    @width = value
  end
  def setHeight=(value)
    @height = value
  end
  def printCount
    puts "instance method: #{@@count}"
  end
  def self.printCount
    puts "class method: #{@@count}"
  end
  def to_s
    "(w:#{@width}, h:#{@height})"
  end
  def getArea
    getWidth() * getHeight
  end
  def getWidth
    @width
  end
  def getHeight
    @height
  end
  private :getWidth, :getHeight
  def printArea
    getWidth() * getHeight
  end
  protected :printArea
  puts "Type of self = #{self.type}"
  puts "Name of self = #{self.name}"
end

class Area < Box
  def initialize(area)
    @area = area
    @@count += 1
    @height = 10
    @width = 20
  end
  def print
    puts "height: #{getHeight}, width: #{getWidth}"
  end
  def getDetail
    DETAIL
  end
end
box = Box.new(10, 20)
new_box = Box.new(20,20)

box.setWidth = 30
box.setHeight = 50

box.printCount()
Box.printCount()

puts "string presentation of box is #{box} "

a = box.getArea()
puts "Area of the box is :#{a}"

area = Area.new(1000)
puts "#{area.getArea}"

puts "area detail: #{area.getDetail}"
# area.setDetail("area")
# box.printArea()
# area.printArea()

Box.printCount()
Area.printCount()
area.printCount()
