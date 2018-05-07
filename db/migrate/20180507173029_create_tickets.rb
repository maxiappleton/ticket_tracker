class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :body
      t.string :status, default: 'new'
      t.integer :project_id
      t.timestamps
    end
  end
end
