class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :alias_name, null: false
      t.string :homepage
      t.string :phone, null: false
      t.string :twitter
      t.string :facebook
      t.string :linkedin
      t.string :job_status, limit: 1
      t.string :job_status_etc
      t.string :dev_languages
      t.string :dev_duration
      t.boolean :dev_web, default: false
      t.boolean :dev_system, default: false
      t.boolean :dev_smart, default: false
      t.text :dev_history
      t.text :community_activity
      t.text :book_author
      t.text :book_trans
      t.boolean :published, default: false

      t.timestamps null: false
    end
    add_foreign_key :profiles, :users
    add_index :profiles, :alias_name, :unique => true
  end
end
