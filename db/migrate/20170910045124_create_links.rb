class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :rocket
      t.string :tinkoff
      t.string :name
      t.string :telegram
      t.integer :weight

      t.timestamps
    end
  end
end
