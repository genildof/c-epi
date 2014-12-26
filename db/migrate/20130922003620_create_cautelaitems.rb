class CreateCautelaitems < ActiveRecord::Migration
  def change
    create_table :cautelaitems do |t|
      t.references :material, index: true
      t.references :cautela, index: true
      t.string :serial
      t.date :validade #, default: 2.years.from_now # 2.months_since(Time.now)
      t.integer :quantidade, default: 1
      t.timestamps
    end
  end
end
