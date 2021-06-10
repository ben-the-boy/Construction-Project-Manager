class Subcontractor < ApplicationRecord
  belongs_to :project
  validates_presence_of :name, :specialty

  def name_with_specialty
    "#{self.name} - #{self.specialty}"
  end

end
