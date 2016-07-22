class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :status, default: 'new', null: false
      t.references :customer, foreign_key: true, null: false, index: true
      t.references :agent, foreign_key: true, index: true

      t.timestamps
    end
  end
end
