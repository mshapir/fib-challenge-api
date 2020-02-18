class CreateFibs < ActiveRecord::Migration[5.2]
  def change
    create_table :fibs do |t|
      t.integer :user_input
      t.boolean :prime, :default => false

      t.timestamps
    end
  end
end
