class User < ApplicationRecord
  has_many :photos
  validates :email, presence: true, format: /@/, uniqueness: true
  validates :password, presence: true, length: { in: 6..20}
  validates :firstname, uniqueness: {scope: :lastname}
  validates_each :firstname, :lastname do |record, attr, value|
    record.errors.add(attr, "must start with upper case") if value =~ /\A[[:lower:]]/
  end
  with_options if: :admin? do |admin|
    admin.validates :password, length: {minimum: 10}
    # validate :password_contain_lower_upper_digit
  end

  # def password_contain_lower_upper_digit
  #
  # end


  after_touch :log_when_photos_or_users_touched
  private
    def log_when_photos_or_users_touched
      puts "Photo/User was touched"
    end
end
