class Material < ApplicationRecord
  belongs_to :project
  validates_presence_of :name, :quantity, :price
end
