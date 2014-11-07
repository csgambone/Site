class CreateGameQuestions < ActiveRecord::Migration
  def change
    create_table :game_questions do |t|
      t.string :given_answer

      t.timestamps
    end
  end
end
