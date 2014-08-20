class AddSourceColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :source, :integer
  end
end
