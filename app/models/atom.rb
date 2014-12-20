class Atom < ActiveRecord::Base
  acts_as_taggable

  has_many :chains
  has_many :stories, through: :chains

  has_many :citations
end
