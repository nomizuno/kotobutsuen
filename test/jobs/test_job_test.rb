require 'test_helper'

class TestJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end

 queue_as :default
 def perform(*args)
   Rails.logger.debug "#{self.class.name}:ジョブを実行しました(#{args.inspect})"
 end

end
