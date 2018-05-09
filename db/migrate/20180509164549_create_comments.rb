class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :ticket_id
      t.integer :creator_id
      t.timestamps
    end
  end
end
