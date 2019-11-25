require 'aws-sdk-sqs'

class Sqs

  attr_accessor :queue_url
  attr_accessor :sqs

  def initialize
    credentials = Aws::Credentials.new(ENV['SQS_ACCESS_KEY'], ENV['SQS_SECRET_KEY'])
    @sqs = Aws::SQS::Client.new(
      region: 'us-east-1',
      credentials: credentials
    )
  end

  def list_queues
    @sqs.list_queues
  end

  def get_queue_url(queue_name)
    @sqs.get_queue_url(queue_name: queue_name)
  end

  def send_message(msg_body)
    @sqs.send_message(queue_url: @queue_url, message_body: msg_body)
  end

  def process_msg(msg)

  end

  def send_to_dlq

  end
end
