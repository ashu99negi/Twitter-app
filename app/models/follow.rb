class Follow < ApplicationRecord
    belongs_to :follower, foreign_key: :follower_id, class_name: "User"  #-----User following Other User
    belongs_to :followed_user, foreign_key: :followed_user_id, class_name: "User"   #-----user followed by other user

    validates :follower_id, presence: true
    validates :followed_user_id, presence: true 
end
