class User < ApplicationRecord
  has_many :projects
  has_many :clients, through: :projects
  has_many :subcontractors, through: :projects
  has_many :materials, through: :projects
  has_secure_password
  validates :username, presence: true, uniqueness: true 
end
