class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|

      t.string :name, null: false
      t.string :creator
      t.text :text

    end
  end
end
