class Cautelaitem < ActiveRecord::Base

  belongs_to :cautela
  belongs_to :material

  default_scope -> { order('material_id DESC') }

  validates_presence_of :material
  validates_presence_of :quantidade

end
