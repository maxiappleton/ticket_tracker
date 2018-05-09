class TicketTag < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :tag
  validates :ticket, uniqueness: { scope: :tag }
end