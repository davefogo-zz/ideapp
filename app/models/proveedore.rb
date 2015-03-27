class Proveedore < ActiveRecord::Base
  belongs_to :ordenes
  has_many :medios, dependent: :destroy
end
