class Job < ActiveRecord::Base

  ESTATUS_ON = '1'
  ESTATUS_OFF = '2'

  resourcify
  include Authority::Abilities
  self.authorizer_name = 'BasicAuthorizer'

  belongs_to :user
  has_many :engages, as: :engageable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one :engage_status, as: :engage_on, dependent: :destroy
  accepts_nested_attributes_for :engage_status, reject_if: proc { |attributes| attributes['started_status'].blank? }

  validates :title, :content, presence: true

  default_scope { order(created_at: :desc)}
end
