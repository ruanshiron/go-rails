class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :src
      t.references :micropost, foreign_key: true

      t.timestamps
    end
    add_index :pictures, [:micropost_id, :created_at]
  end
end
