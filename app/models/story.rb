class Story < ActiveRecord::Base
  acts_as_taggable_on :themes

  has_many :headlines
  has_many :leadlines

  belongs_to :section

  has_many :chains, -> { order("position ASC") }
  has_many :atoms, through: :chains
end
