class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :nome
      t.references :fabrica, null: false, uniqueindex: true
      t.timestamps
    end
  end
end

# defining table by pure SQL
#execute <<EOS
#
#create table .... (
#  ....
#);
#
#EOS