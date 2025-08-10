class RemoveTitleOffArticles < ActiveRecord::Migration[8.0]
  def change
    remove_column :articles, :title, :string
  end
end
