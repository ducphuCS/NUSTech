class Photo < ApplicationRecord
  validates :title, presence: true
  belongs_to :users, touch: true
  after_touch do
    puts 'An Photo was touched'
  end
end
