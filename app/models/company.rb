class Company < ApplicationRecord
  validates :name, presence: true
  has_many :jobs

  def premium?
    jobs.count  > 4
  end
end
