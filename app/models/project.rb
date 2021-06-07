class Project < ApplicationRecord
  belongs_to :user
  has_many :subcontractors
  has_many :materials 
end
