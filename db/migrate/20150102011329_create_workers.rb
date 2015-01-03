class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :workers, :users
  end
end
