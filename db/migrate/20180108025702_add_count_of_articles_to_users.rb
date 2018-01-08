class AddCountOfArticlesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :count_of_articles, :int
  end
end
