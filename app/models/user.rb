class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles  
  has_one_attached :avatar
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followed_user, through: :followed_user_users
  has_many :following_users, foreign_key: :followed_user_id, class_name: 'Follow'
  has_many :followers, through: :following_users


  def follow
    @user = User.find(params[:id])
    current_user.followed_user << @user
    redirect_back(fallback_location: user_path(@user))
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followed_user_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

end
