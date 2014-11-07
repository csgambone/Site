class CreateJoinTableGameSource < ActiveRecord::Migration
  def change
    create_join_table :games, :sources do |t|
      # t.index [:game_id, :source_id]
      # t.index [:source_id, :game_id]
    end
  end
end
