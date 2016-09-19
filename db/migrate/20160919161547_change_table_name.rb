class ChangeTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :questions_tables, :questions
  end
end
