class EngageStatus < ActiveRecord::Base
  belongs_to :engage_on, polymorphic: true
end
