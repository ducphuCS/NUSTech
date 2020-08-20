class Photo < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, optional: true, counter_cache: :photo_count
end
