class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :subject
      t.string :mast_url
      t.string :thumb_url

      t.timestamps
    end
  end
end
