class User < ActiveRecord::Base

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
    mount_uploader :avatar, AvatarUploader

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited(post)
    favorites.where(post_id: post.id).first
  end

# takes a post object and returns a voted object if one exists 
# in the votes table with the appropirate user_id and post_id
# if there is none the method will return nil
  def voted(post) 
    votes.where(post_id: post.id).first
  end
end
