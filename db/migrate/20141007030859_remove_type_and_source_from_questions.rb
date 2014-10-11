class RemoveTypeAndSourceFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :type, :integer
    remove_column :questions, :source, :integer
  end
end
