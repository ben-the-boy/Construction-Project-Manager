class User < ApplicationRecord
  has_many :projects
  has_many :subcontractors, through: :projects
  has_many :materials, through: :projects
  has_secure_password
end
