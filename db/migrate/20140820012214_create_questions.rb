class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.string :answer
      t.integer :type
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5

      t.timestamps
    end
  end
end
