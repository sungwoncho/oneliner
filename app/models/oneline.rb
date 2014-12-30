class Oneline < ActiveRecord::Base
  validates_presence_of :subject
  validates_presence_of :definition

  scope :search, -> (keyword) {
    where('subject LIKE ?', "%#{keyword}%") if keyword.present?
  }
end
