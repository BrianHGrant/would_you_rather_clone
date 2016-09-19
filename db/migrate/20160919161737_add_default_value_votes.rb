class AddDefaultValueVotes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :questions, :a_votes, 0
    change_column_default :questions, :b_votes, 0
  end
end
