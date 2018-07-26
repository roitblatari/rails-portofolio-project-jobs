class Employee < ApplicationRecord
  has_many :jobs
  has_many :employers, through: :jobs


  validates :name, presence: :true
  validates :email, presence: :true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true
  has_secure_password

end
