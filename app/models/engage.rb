class Engage < ActiveRecord::Base
  belongs_to :engageable, polymorphic: true
  belongs_to :user
end
