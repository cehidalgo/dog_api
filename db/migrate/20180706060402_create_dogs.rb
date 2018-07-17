class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.text :race_name
      t.string :img_url
      t.integer :times_picked_at_random

      t.timestamps
    end
  end
end
