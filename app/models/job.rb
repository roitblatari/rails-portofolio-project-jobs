class Job < ApplicationRecord
  belongs_to :employee, optional: true 
  belongs_to :employer

  validates :title, presence: :true
  validates :address, presence: :true
  validates :state, presence: :true
  validates :date, presence: :true
end
