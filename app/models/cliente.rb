class Cliente < ActiveRecord::Base
  belongs_to :colaboradore
  belongs_to :user
  has_many :presupuestos
  has_many :facturas
  has_many :recibo_de_cajas
  has_many :transaccions
  has_many :ajustes
  validates :nombre, :nit, presence: true, uniqueness: true
  validates :nit, length: {is: 11} 

  #def self.search(search)
  	#where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
  #end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Cliente.create! row.to_hash
    end
  end


  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |cliente|
        csv << cliente.attributes.values_at(*column_names)
      end
    end
  end
end
