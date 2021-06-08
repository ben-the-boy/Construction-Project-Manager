class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :materials
  has_many :subcontractors
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :subcontractors, reject_if: :all_blank
  accepts_nested_attributes_for :materials, reject_if: :all_blank

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |material_attribute|
      if self.materials.find_by(name: material_attribute[:name])
        material = self.materials.find_by(name: material_attribute[:name])
        material.update(material_attribute)
      else
        material = self.materials.create(material_attribute)
      end
    end
  end

end
