class Album < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, optional: true, counter_cache: :album_count
  before_save :ensure_description_has_a_value
  private
  def ensure_description_has_a_value
    unless description.present?
      self.description = "This is album of user has id " + self.user_id.to_s
    end
  end
end
