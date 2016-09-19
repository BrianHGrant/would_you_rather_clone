class ChangeVotesTypeToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :a_votes, :float
    change_column :questions, :b_votes, :float
  end
end
