class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  #1人1ついいね
  validates_uniqueness_of :tweet_id, scope: :user_id
end
