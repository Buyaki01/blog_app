class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :Users do |t|
      t.string :Name
      t.string :Photo
      t.text :Bio
      t.timestamps
      t.integer :PostsCounter
    end
  end
end
