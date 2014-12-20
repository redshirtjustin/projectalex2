class Chain < ActiveRecord::Base
  belongs_to :story
  belongs_to :atom
end
