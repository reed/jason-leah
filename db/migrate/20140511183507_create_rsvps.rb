class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :email
      t.string :guests, array: true, default: []
      t.string :restrictions

      t.timestamps
    end
  end
end
