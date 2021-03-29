class CreateJoinTableThemeTweet < ActiveRecord::Migration[6.1]
  def change
    create_join_table :themes, :tweets
  end
end
