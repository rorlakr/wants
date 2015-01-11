class CreateEngageStatuses < ActiveRecord::Migration
  def change
    create_table :engage_statuses do |t|
      t.references :engage_on, polymorphic: true, index: true
      t.string :started_status, null: false
      t.datetime :started_at
      t.datetime :expired_at

      t.timestamps null: false
    end
  end
end
