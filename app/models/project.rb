class Project < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :materials
  has_many :subcontractors
  accepts_nested_attributes_for :client, reject_if: :all_blank
  accepts_nested_attributes_for :subcontractors, reject_if: :all_blank
  accepts_nested_attributes_for :materials, reject_if: :all_blank
  validates_presence_of :name
  scope :longest_project, -> { where("length = ?", self.maximum(:length)) }

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |material_attribute|
      if self.materials.find_by(name: material_attribute[:name])
        material = self.materials.find_by(name: material_attribute[:name])
        material.update(material_attribute)
      else
        if !material_attribute.values.include?("")
          material = self.materials.create(material_attribute)
        end
      end
    end
  end

  def subcontractors_attributes=(subcontractor_attributes)
    subcontractor_attributes.values.each do |subcontractor_attribute|
      if !subcontractor_attribute.values.include?("")
        if Subcontractor.find_by(name: subcontractor_attribute[:name])
          subcontractor = Subcontractor.find_by(name: subcontractor_attribute[:name])
          if subcontractor.specialty != subcontractor_attribute[:specialty]
            subcontractor = Subcontractor.create(subcontractor_attribute)
            self.subcontractors << subcontractor
          else
            self.subcontractors << subcontractor
          end
        else
          subcontractor = Subcontractor.create(subcontractor_attribute)
          self.subcontractors << subcontractor
        end
      end
    end
  end

  def client_attributes=(client_attributes)
    if Client.find_by(name: client_attributes[:name])
      client = Client.find_by(name: client_attributes[:name])
      if client.email != client_attributes[:email]
        client = Client.create(client_attributes)
        self.client = client
      else
        self.client = client
      end
    else
      client = Client.create(client_attributes)
      self.client = client
    end
  end


end
