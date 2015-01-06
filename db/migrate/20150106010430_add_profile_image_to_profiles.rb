class AddProfileImageToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_image_id, :string
  end
end
