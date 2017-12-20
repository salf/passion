module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(defined?(response) ? response.body : response_body)
    end
  end
end
