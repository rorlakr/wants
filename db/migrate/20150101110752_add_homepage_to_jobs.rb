class AddHomepageToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :homepage, :string
  end
end
