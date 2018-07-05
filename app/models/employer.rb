class Employer < ApplicationRecord
  has_many :jobs
  has_many :employees, through: :jobs
  has_secure_password
end
