class AddIndexToTicketTags < ActiveRecord::Migration[5.2]
  def change
    add_index :ticket_tags, [:ticket_id, :tag_id], unique: true
  end
end
