class AddCreatorColumnToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :creator_id, :integer
  end
end
