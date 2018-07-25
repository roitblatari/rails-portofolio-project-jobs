class Job < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :employer

  validates :title, presence: :true
  validates :address, presence: :true
  validates :state, presence: :true
  validates :date, presence: :true

  scope :future_jobs, -> (date) { where("date > ?", Date.today) }

  # scope :old_jobs, -> (date) { where("date < ?", Date.today) }
  # scope :future_jobs, lambda { where("date > ?", Date.today) }
  # scope :future_jobs, where(:date => Date.today)
  # scope :name, lambda { |param| where(:field => "value") }
end
