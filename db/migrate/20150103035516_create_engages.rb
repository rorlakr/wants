class CreateEngages < ActiveRecord::Migration
  def change
    create_table :engages do |t|
      t.references :user, index: true
      t.boolean :shared_profile, default: false
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :engages, :users
  end
end
