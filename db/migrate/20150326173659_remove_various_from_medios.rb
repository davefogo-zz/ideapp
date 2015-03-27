class RemoveVariousFromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :ordene_id, :integer
    remove_column :medios, :presupuesto_id, :integer
  end
end
