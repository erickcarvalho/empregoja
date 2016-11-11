class Job < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true

  belongs_to :company
  belongs_to :category

  def expired?
     created_at < 90.days.ago
  end

  def recent?
    created_at > 6.days.ago
  end

end
