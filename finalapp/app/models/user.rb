class User < ApplicationRecord
  has_many :photos
  has_many :albums
  validates :email, presence: true, format: /@/, uniqueness: true
  validates :password, presence: true, length: { in: 6..20}
  validates :firstname, uniqueness: {scope: :lastname}
  validates_each :firstname, :lastname do |record, attr, value|
    record.errors.add(attr, "must start with upper case") if value =~ /\A[[:lower:]]/
  end
  with_options if: :admin? do |admin|
    admin.validates :password, length: {minimum: 10}
  end

end
