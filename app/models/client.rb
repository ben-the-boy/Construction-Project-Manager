class Client < ApplicationRecord
  has_many :projects
  has_many :users, through: :projects
  validates_presence_of :name, :email 
end
