class Employee < ApplicationRecord
  has_many :jobs
  has_many :employers, through: :jobs
end
