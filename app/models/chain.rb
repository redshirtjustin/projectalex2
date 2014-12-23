class Chain < ActiveRecord::Base
  belongs_to :story
  belongs_to :atom

  acts_as_list scope: :story
end
