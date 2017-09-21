class CreateAnswerChoice < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.string :answer
      t.integer :question_id

      t.timestamps
    end

    add_index :answer_choices, :answer
  end
end
