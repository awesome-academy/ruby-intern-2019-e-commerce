class ReplyComment < ApplicationRecord
  belongs_to :comment_rating
  belongs_to :user
end
