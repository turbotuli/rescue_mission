class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
