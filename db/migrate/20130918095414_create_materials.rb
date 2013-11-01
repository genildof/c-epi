class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :tipo, default: 'EPI'
      t.string :codigo
      t.string :nome
      t.timestamps
    end
  end
end
