class User < ApplicationRecord
  has_many :projects
  has_many :clients, through: :projects
  has_many :subcontractors, through: :projects
  has_many :materials, through: :projects
  has_secure_password
  validates_presence_of :username
end
