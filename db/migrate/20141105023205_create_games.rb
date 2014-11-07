class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :question_count

      t.timestamps
    end
  end
end
