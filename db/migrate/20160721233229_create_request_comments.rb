class CreateRequestComments < ActiveRecord::Migration[5.0]
  def change
    create_table :request_comments do |t|
      t.text :text, null: false
      t.references :request, foreign_key: true, index: true, null: false
      t.references :author, polymorphic: true, index: true, null: false

      t.timestamps
    end
  end
end
