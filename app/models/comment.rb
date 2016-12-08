class Comment < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :fact
  validates :content, presence: true
end
