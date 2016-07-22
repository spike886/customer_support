class CreateAgents < ActiveRecord::Migration[5.0]
  def change
    create_table :agents do |t|
      t.string :email, index: true, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
