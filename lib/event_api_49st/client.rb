require "uri"
require 'httparty'
require 'json'

module EventApi49st

	class APIError < StandardError
		attr_reader :response


		# Creates a new exception.
		def initialize(response)
			super
			@response = response
		end

		# The error string returned by the API call.
		def to_s
			"Error code: #{@response['error_code']}. Error message: #{@response['error_message']}"
		end
	end


	class Client
		include HTTParty
		base_uri 'http://api.49st.com'

		debug_output $stderr

		def self.perform(method, hash)
			query = EventApi49st.query(hash)
			#puts query
			response = HTTParty.post('http://api.49st.com/api/' + method, :body => query)

			#puts response.body, response.code, response.message, response.headers.inspect

			parsed = JSON.parse(response)
			raise APIError.new(parsed) if (parsed.is_a?(Hash) && parsed.has_key?("error_code") && parsed["error_code"] != 200)
			parsed
		end

	end
end