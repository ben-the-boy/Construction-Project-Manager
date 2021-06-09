class Subcontractor < ApplicationRecord
  belongs_to :project

  def name_with_specialty
    "#{self.name} - #{self.specialty}"
  end

end
