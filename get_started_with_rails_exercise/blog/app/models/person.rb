class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.name == "Evil"
      record.errors[:base] << "This person is evil"
    end
  end
end

class Person < ApplicationRecord
  validates :name, presence: {strict: true}
  validates_with GoodnessValidator
  validates_each :name, :surname do |record, attr, value|
    record.errors.add(attr, "must start with upper case") if value =~ /\A[[:lower:]]/
  end
end
