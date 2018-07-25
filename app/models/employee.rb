class Employee < ApplicationRecord
  has_many :jobs
  has_many :employers, through: :jobs


    validates :name, presence: :true
    validates :email, presence: :true
    # validates :profession, presence: :true

  validates :email, uniqueness: true
  has_secure_password

end
