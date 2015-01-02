class Oneline < ActiveRecord::Base
  validates_presence_of :subject
  validates_presence_of :definition

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :votes
  has_many :upvotes,
           -> { where vote_type: 'up' },
           class_name: 'Vote'
  has_many :downvotes,
           -> { where vote_type: 'down' },
           class_name: 'Vote'

  scope :search, -> (keyword) {
    where('subject LIKE ?', "%#{keyword}%") if keyword.present?
  }

  def is_author?(user)
    return false unless user

    author_id == user.id
  end

  def upvote_count
    upvotes.count
  end

  def downvote_count
    downvotes.count
  end
end
