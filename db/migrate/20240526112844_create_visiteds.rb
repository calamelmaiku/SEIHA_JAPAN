class CreateVisiteds < ActiveRecord::Migration[7.0]
  def change
    create_table :visiteds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true
      t.boolean :visited

      t.timestamps
    end
  end
end
