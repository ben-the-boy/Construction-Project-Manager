class Project < ApplicationRecord
  belongs_to :user
  belongs_to :subcontractor
  has_many :materials
end
