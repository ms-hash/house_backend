class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :prefecture
      t.string :city
      t.string :suite
      t.references :architecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
