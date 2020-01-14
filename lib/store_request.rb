require 'aws-sdk-dynamodb'
require 'securerandom'

class StoreRequest
  include Concurrent::Async


  def initialize
    credentials = Aws::Credentials.new(ENV['SQS_ACCESS_KEY'], ENV['SQS_SECRET_KEY'])
    @dynamodb = Aws::DynamoDB::Client.new(
      region: 'us-east-1',
      credentials: credentials
    )
  end

  def save(request_data)

    item = {
      id: SecureRandom.hex(4),
      requested_at: DateTime.now.to_time.utc.iso8601,
      query_string: request_data['rack.request.query_string'],
      query_hash: request_data['rack.request.query_hash']
    }

    params = {
      table_name: 'request_logger',
      item: item
    }

    begin
      resp = @dynamodb.put_item(params)
    rescue Aws::DynamoDB::Errors::ServiceError => error
      puts 'Unable to add item:'
      puts error.message
    end

  end
end
