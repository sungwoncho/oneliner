class Oneline < ActiveRecord::Base
  validates_presence_of :subject
  validates_presence_of :definition

  belongs_to :author, class_name: 'User', foreign_key: :author_id

  scope :search, -> (keyword) {
    where('subject LIKE ?', "%#{keyword}%") if keyword.present?
  }

  def is_author?(user)
    return false unless user
    
    author_id == user.id
  end
end
