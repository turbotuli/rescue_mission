class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.belongs_to :user
      t.belongs_to :question

      t.timestamps
    end
    add_index :answers, [:user_id, :question_id], unique: true
  end
end
