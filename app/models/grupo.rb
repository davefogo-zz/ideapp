class Grupo < ActiveRecord::Base
  belongs_to :clase
  has_many :cuenta_puc

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		Grupo.create! row.to_hash
  	end
  end
end
