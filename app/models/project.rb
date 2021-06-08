class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :materials
  has_many :subcontractors
  accepts_nested_attributes_for :client, :subcontractors
end
