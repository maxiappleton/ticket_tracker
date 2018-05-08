class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags
end