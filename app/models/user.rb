class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authored_onelines, class_name: 'Oneline', foreign_key: :author_id
  has_many :votes

  def upvote(oneline)
    oneline.increment!(:cached_votes)
    votes.create(oneline: oneline, vote_type: 'up')
  end

  def upvoted?(oneline)
    votes.where(oneline_id: oneline.id, vote_type: 'up').present?
  end

  def downvoted?(oneline)
    votes.where(oneline_id: oneline.id, vote_type: 'down').present?
  end
end
