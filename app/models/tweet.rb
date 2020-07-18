class Tweet < ApplicationRecord
    mount_uploader :image, ImageUploader

    #アソシエーション(1:多)
    belongs_to :user

    #いいね
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    #コメント
    has_many :comments, dependent: :destroy

end
