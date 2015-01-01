class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authored_onelines, class_name: 'Oneline', foreign_key: :author_id
  has_many :votes

  def upvote(oneline)
    if downvoted?(oneline)
      votes.find_by(oneline_id: oneline.id, vote_type: 'down').update(vote_type: 'up')
      oneline.increment!(:cached_votes, 2)
    elsif upvoted?(oneline)
      votes.find_by(oneline_id: oneline.id, vote_type: 'up').destroy
      oneline.increment!(:cached_votes, -1)
    else
      votes.create(oneline: oneline, vote_type: 'up')
      oneline.increment!(:cached_votes)
    end
  end

  def downvote(oneline)
    if downvoted?(oneline)
      votes.find_by(oneline_id: oneline.id, vote_type: 'down').destroy
      oneline.increment!(:cached_votes, 1)
    elsif upvoted?(oneline)
      votes.find_by(oneline_id: oneline.id, vote_type: 'up').update(vote_type: 'down')
      oneline.increment!(:cached_votes, -2)
    else
      votes.create(oneline: oneline, vote_type: 'down')
      oneline.increment!(:cached_votes, -1)
    end
  end

  def upvoted?(oneline)
    votes.where(oneline_id: oneline.id, vote_type: 'up').present?
  end

  def downvoted?(oneline)
    votes.where(oneline_id: oneline.id, vote_type: 'down').present?
  end
end
