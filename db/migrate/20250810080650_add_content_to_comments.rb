class AddContentToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :content, foreign_key: true
  end
end
