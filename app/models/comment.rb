class Comment < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :ticket
  validates :body, presence: true
end