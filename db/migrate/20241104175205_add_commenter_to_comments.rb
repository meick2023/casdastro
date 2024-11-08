class AddCommenterToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :commenter, :string
  end
end
