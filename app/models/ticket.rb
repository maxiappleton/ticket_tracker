class Ticket < ActiveRecord::Base
  STATUS_OPTIONS = %w( new blocked in_progress fixed ).freeze

  validates :name, presence: true
  validates_inclusion_of :status, in: STATUS_OPTIONS, message: "%{value} is not a valid status"

  belongs_to :project
end