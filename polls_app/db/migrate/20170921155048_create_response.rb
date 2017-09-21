class CreateResponse < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :response_id

      t.timestamps
    end

    add_index :responses, :user_id
    add_index :responses, :response_id
  end
end
