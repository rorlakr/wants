class TestJob < ActiveJob::Base
  queue_as :test

  def perform(obj)
    puts obj
  end
end
