class CreateJoinTableGameType < ActiveRecord::Migration
  def change
    create_join_table :games, :types do |t|
      # t.index [:game_id, :type_id]
      # t.index [:type_id, :game_id]
    end
  end
end
