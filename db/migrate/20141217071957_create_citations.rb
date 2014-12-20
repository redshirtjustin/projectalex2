class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.string :title
      t.string :url
      t.belongs_to :atom, index: true

      t.timestamps
    end
  end
end
