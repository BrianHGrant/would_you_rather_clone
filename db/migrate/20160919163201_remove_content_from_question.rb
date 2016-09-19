class RemoveContentFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :content, :string
  end
end
