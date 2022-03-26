class Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :Comments do |t|
      t.references :User, null: false, foreign_key: true, index: true
      t.references :Post, null: false, foreign_key: true, index: true
      t.text :Text
      t.timestamps
    end
  end
end
