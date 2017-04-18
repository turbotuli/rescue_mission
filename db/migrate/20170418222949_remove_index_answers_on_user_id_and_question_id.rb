class RemoveIndexAnswersOnUserIdAndQuestionId < ActiveRecord::Migration[5.0]
  def up
    remove_index :answers, [:user_id, :question_id]
  end

  def down
    add_index :answers, [:user_id, :question_id]
  end
end
