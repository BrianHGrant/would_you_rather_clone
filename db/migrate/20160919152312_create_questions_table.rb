class CreateQuestionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_tables do |t|
      t.column :content, :string
      t.column :a_answer, :string
      t.column :a_votes, :integer
      t.column :b_answer, :string
      t.column :b_votes, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
