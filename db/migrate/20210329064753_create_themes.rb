class CreateThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :themes do |t|
      t.string :name
      t.references :parent, foreign_key: {to_table: :themes}
      t.string :color

      t.timestamps
    end
  end
end
