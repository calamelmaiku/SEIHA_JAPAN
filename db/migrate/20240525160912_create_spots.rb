class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|

      t.string :name, null: false
      t.text :text
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :group, null: false

    end
  end
end
