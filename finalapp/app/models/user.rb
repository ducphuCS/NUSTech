class User < ApplicationRecord
  has_many :photos
  has_many :albums
  has_many :likes

  has_many :follower_relationships, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, through: :follower_relationships, source: :follower  #@user.followers is list of users that follow this user

  has_many :followee_relationships, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, through: :followee_relationships, source: :followee  #@user.followees is list of users that this user follow


  validates :email, presence: true, format: /@/, uniqueness: true
  validates :password, presence: true, length: { in: 6..20}
  validates :firstname, uniqueness: {scope: :lastname}
  validates_each :firstname, :lastname do |record, attr, value|
    record.errors.add(attr, "must start with upper case") if value =~ /\A[[:lower:]]/
  end
  with_options if: :admin? do |admin|
    admin.validates :password, length: {minimum: 10}
  end

  before_create :set_default_value_for_last_login
  def set_default_value_for_last_login
    self.last_login = self.created_at
  end

  scope :admin, -> {where(admin: true)}
end
