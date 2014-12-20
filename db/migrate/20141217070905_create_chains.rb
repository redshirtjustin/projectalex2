class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.belongs_to :story, index: true
      t.belongs_to :atom, index: true
      t.boolean :active
      t.integer :position

      t.timestamps
    end
  end
end
