class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.references :account, null: false, foreign_key: true
      t.text :url
      t.text :text
      t.string :identifier

      t.timestamps
    end
  end
end
