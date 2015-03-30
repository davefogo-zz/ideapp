class Proveedore < ActiveRecord::Base
  has_many :medios, dependent: :destroy
end
