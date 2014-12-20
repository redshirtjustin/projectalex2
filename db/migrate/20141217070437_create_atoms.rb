class CreateAtoms < ActiveRecord::Migration
  def change
    create_table :atoms do |t|
      t.text :topic
      t.text :content
      t.text :quote
      t.string :quoted_name
      t.string :quoted_title
      t.string :quoted_org
      t.string :img_url
      t.string :img_caption
      t.string :img_citation
      t.string :img_location
      t.date :display_date

      t.timestamps
    end
  end
end
