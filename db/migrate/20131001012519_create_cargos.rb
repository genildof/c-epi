class CreateCargos < ActiveRecord::Migration
  def down
    drop_table :cargos do |t|
      t.string :nome
      t.boolean :periculosidade
      t.timestamps
    end
  end

  def up
    create_table :cargos do |t|
      t.string :nome
      t.string :periculosidade, null: false, default: 'NAO'
      t.timestamps
    end
  end


end
