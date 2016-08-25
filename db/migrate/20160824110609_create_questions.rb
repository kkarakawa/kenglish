class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :answer
      t.string :hint_title
      t.text :hint
      t.integer :times, default: 0, null: false
      t.integer :correct, default: 0, null: false
      t.integer :incorrect, default: 0, null: false
      t.timestamps
    end
  end
end
