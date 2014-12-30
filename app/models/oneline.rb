class Oneline < ActiveRecord::Base
  validates_presence_of :subject
  validates_presence_of :definition
end
