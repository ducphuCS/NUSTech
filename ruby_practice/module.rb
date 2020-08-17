$LOAD_PATH << '.'
require 'trig'

y = Trig.sin(Trig::PI/4)
wrongdoing = Moral.sin(Moral::VERY_BAD)

class Decade
  include Week
  @@no_of_yrs = 10
  def initialize(yrs)
    @yrs = yrs
  end
  def no_of_months
    number = @yrs * 12
    puts number
  end
  def default_months
    number = @@no_of_yrs * 12
    puts number
  end
end

d1 = Decade.new(9)
puts Week::FIRST_DAY
Week.week_in_month
Week.week_in_year
d1.no_of_months
d1.default_months
puts d1.first_day
