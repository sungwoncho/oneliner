class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :oneline

  validates_presence_of :vote_type
end
