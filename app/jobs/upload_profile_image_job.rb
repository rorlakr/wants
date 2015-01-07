class UploadProfileImageJob < ActiveJob::Base
  queue_as :default

  def perform(record)
    record.save
  end
end
