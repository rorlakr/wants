class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.references :user, index: true
      t.boolean :shared_profile, default: false
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :applies, :users
  end
end
