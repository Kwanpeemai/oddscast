class CreateContents < ActiveRecord::Migration[8.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.belongs_to :contentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
