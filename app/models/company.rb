class Company < ApplicationRecord
  has_many :jobs

  def premium?
    jobs.count  > 4
  end
end
