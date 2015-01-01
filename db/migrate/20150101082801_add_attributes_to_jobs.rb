class AddAttributesToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :content, :text
  end
end
