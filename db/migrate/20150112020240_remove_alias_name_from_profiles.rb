class RemoveAliasNameFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :alias_name, :string
  end
end
