class CreateArchitectures < ActiveRecord::Migration[7.1]
  def change
    create_table :architectures do |t|
      t.string :name
      t.string :imageUrl
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
