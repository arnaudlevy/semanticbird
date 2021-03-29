class AddLexemsToThemes < ActiveRecord::Migration[6.1]
  def change
    add_column :themes, :lexems, :text
  end
end
