class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company, null: false
      t.string :intro, null: false
      t.date :from
      t.date :to
      t.boolean :always, default: false
      t.string :contact, null: false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :jobs, :users
  end
end
