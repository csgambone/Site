class CreateJoinTableQuestionSource < ActiveRecord::Migration
  def change
    create_join_table :questions, :sources do |t|
      # t.index [:question_id, :source_id]
      # t.index [:source_id, :question_id]
    end
  end
end
