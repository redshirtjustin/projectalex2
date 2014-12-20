class AddSectionIdToStory < ActiveRecord::Migration
  def change
	change_table :stories do |t|
	  t.belongs_to :section
	end
  end
end
