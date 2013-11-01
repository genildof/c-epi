class CreateFabricas < ActiveRecord::Migration
  def change
    create_table :fabricas do |t|
      t.string :nome
      t.string :estado
      t.timestamps
    end
  end
end
