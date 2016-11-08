class Job < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true

  belongs_to :company
  belongs_to :category
end
