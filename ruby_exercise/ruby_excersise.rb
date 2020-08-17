class Person
  #Question 3 Class Person có 1 class variable là count.
  @@count = 0
  # Question 2: Khi khởi tạo 1 Person có thể truyền 'name' và 'age'
  def initialize(name, age)
    @name = name
    @age = age
    # Question 4: Mỗi lần khởi tạo 1 Person thì biến count sẽ tăng lên 1.
    @@count += 1
  end
  # Question 1: Mỗi Person có 2 instance variable là 'name' và 'age'. Tạo setter và getter cho 'name' và 'age'
  def getName
    @name
  end
  def getAge
    @age
  end
  def setName=(new_name)
    @name = new_name
  end
  def setAge=(new_age)
    @age = new_age
  end
  # Question 5: Person có 1 instane method tên là 'introduce' sẽ in ra kết quả là: "My name is [name của person đó]. I'm [age của person đó] years old".
  def introduce
    puts "My name is #{@name}. I'm #{@age} years old"
  end
  # Question 6 Person có 1 class method tên là 'total_count' sẽ in ra kết quả là: "Total number of people is [tổng số Person đã được tạo]"
  def self.total_count
    puts "Total number of people is #{@@count}"
  end
  # Question 17: Viết 1 instance method bất kì, raise Exception (với message bất kì) trong method đó, sau đó catch exception và in ra message của Exception đó.
  def err
    begin
      raise "a error happened"
    rescue Exception => e
      puts "error message is : #{e.message}"
    end
  end
end

def printPeople(people)
  people.each do |person|
    print "#{person.introduce}"
  end
end
# Question 7:Dùng hàm 'times' tạo 1 mảng 'people' gồm 20 person với name là 'Person 1' cho đến 'Person 20', age của mỗi Person random từ 10 -> 90
def create_people
  number = 20
  people = Array.new
  number.times {
    |i| people << Person.new("Person #{i+1}", rand(10..90))
  }
  return people
end
$people = create_people
$people[0].err
# printPeople($people)

# Question 8: Với mảng 'people' lọc ra những Person có tuổi nhỏ hơn 18
def people_u18(people)
  people_u18 = people.select { |person| person.getAge < 18 }
  printPeople(people_u18)
  return people_u18
end
# people_u18($people)

# Question9: Với mảng 'people' xóa những Person có tuổi nhỏ hơn 18
def people_o18(people)
  people.delete_if { |person| person.getAge < 18 }
  printPeople(people)
end
# people_o18($people)

# Question 10: Sort mảng 'people' theo tuổi tăng dần.
def sort_asc(people)
  people = people.sort { |a, b| a.getAge <=> b.getAge }
  printPeople(people)
end
# sort_asc($people)

# Question 11: Sort mảng 'people' theo tuổi giảm dần.
def sort_dec(people)
  people = people.sort { |a, b| b.getAge <=> a.getAge}
  printPeople(people)
end
# sort_dec($people)

# Quesion 12: Delete 1 phần tử ở vị trí xác định trong mảng 'people'
def del_at(people, pos)
  people.delete_at(pos-1)
  printPeople(people)
end
# del_at($people, 3)

# Question 13: tìm ra Person lớn tuổi nhất, Person nhỏ tuổi nhất.
def maxmin(people)
  max_person = people.max_by { |person| person.getAge}
  min_person = people.min_by { |person| person.getAge}
  puts "max person: #{max_person.introduce}"
  puts "min person: #{min_person.introduce}"
end
# maxmin($people)

# Question 14:
def icr1(people)
  i = 0
  puts "before"
  printPeople(people)
  #1
  while i < people.length
    people[i].setAge = (people[i].getAge + 1)
    i += 1
  end
  #2
  i = 0
  until i ==  people.length
    people[i].setAge = (people[i].getAge + 1)
    i+= 1
  end
  #3
  for person in people
    person.setAge = (person.getAge + 1)
  end
  #4
  people.each do |person|
    person.setAge = (person.getAge + 1)
  end
  #5
  people.collect { |person| person.setAge = (person.getAge + 1) }
  #6
  people.map { |person| person.setAge = (person.getAge + 1)}
  #7
  people.select { |person| person.setAge = (person.getAge + 1)}
  #8
  people.take_while { |person| person.setAge = (person.getAge + 1)}

  puts "after"
  printPeople(people)
end
# icr1($people)

# Question 15: Không dùng vòng lặp (dùng CÁC hàm của Array) lấy ra tất cả các 'age' của các Person trong mảng 'person'
def getAges(people)
  ages = Array.new
  #1
  people.each do |person|
    ages << person.getAge
  end
  #2
  ages = Array.new
  people.collect { |person| ages << person.getAge }
  #3
  ages = Array.new
  people.map { |person| ages << person.getAge }
  #4
  ages = Array.new
  people.select { |person| ages << person.getAge }
  #5
  ages = Array.new
  people.take_while { |person| ages << person.getAge }
  #6
  ages = Array.new
  people.drop_while { |person| ages << person.getAge}
  puts "#{ages}"
end
# getAges($people)

# Question 16: Tạo 1 mảng 'people_2' tương tự câu 7, nối mảng 'people_2' vào 'people'
def ques16(people)
  people_2 = create_people()
  people.concat(people_2)
  printPeople(people)
end
# ques16($people)
