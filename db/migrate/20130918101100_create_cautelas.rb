class CreateCautelas < ActiveRecord::Migration
  def change
    create_table :cautelas do |t|
      t.references :colaborador, index: true
      t.references :user, index: true
      t.date :data
      t.string :status
      t.string :anexo
      t.text :comentarios

      t.timestamps
    end
  end
end
