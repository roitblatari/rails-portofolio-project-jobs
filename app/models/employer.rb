class Employer < ApplicationRecord
  has_many :jobs
  has_many :employees, through: :jobs

  validates :name, presence: :true
  validates :email, presence: :true
  # validates :profession, presence: :true


  validates :email, uniqueness: true
  has_secure_password

end
