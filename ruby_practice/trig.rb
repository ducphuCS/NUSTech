puts "load path: #{$LOAD_PATH}"

module Trig
  PI = 3.141592654
  def Trig.sin(x)
    puts "sin: #{x}"
  end
  def Trig.cos(x)
    puts "cos: #{x}"
  end
end

module Moral
  VERY_BAD = 0
  BAD = 1
  def Moral.sin(badness)
    puts "#{badness}"
  end
end

module Week
  FIRST_DAY = "Sunday"
  def Week.week_in_month
    puts "You have four weeks in a month"
  end
  def Week.week_in_year
    puts "You have 52 weeks in a year"
  end
  def first_day
    puts Week::FIRST_DAY
  end
end
