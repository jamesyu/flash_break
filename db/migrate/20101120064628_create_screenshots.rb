class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.boolean :approved, :default => 0, :null => false
      t.string :twitter
      t.string :url, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :screenshots
  end
end
