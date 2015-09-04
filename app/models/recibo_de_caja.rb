class ReciboDeCaja < ActiveRecord::Base
  belongs_to :cliente
  has_many :recibo_items
end
