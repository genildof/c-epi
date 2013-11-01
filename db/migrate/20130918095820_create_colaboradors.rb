class CreateColaboradors < ActiveRecord::Migration
  def change
    create_table :colaboradors do |t|
      t.string :matricula
      t.string :nome
      t.references :cargo, index: true
      t.references :cidade, index: true
      t.date :admissao
      t.string :desligado, default: 'NAO'
      t.timestamps
    end
  end
end
