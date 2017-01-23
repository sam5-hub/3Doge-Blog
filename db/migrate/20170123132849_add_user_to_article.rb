class AddUserToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :user_id, :string
  end
end
