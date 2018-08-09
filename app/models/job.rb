class Job < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :employer

  validates :title, presence: :true
  validates :address, presence: :true
  validates :state, presence: :true
  validates :date, presence: :true

  scope :future_jobs, ->  { where("date > ?", Date.today) }
  scope :past_jobs, -> { where("date < ?", Date.today) }

end
