require_relative "./event_api_49st/version"
require_relative "./event_api_49st/client"
require "forwardable"
require 'uri'
require "digest/md5"

module EventApi49st
	API_VERSION = '2.0'
	@config = Struct.new(:api_key, :secret_key).new

	class << self
		extend Forwardable
		def_delegators :@config, :api_key, :secret_key

		def configure (&block)
			yield @config
		end

		def query (hash)
			default_parameters = {
				:version => API_VERSION,
				"api_key" => api_key,
				"format" => 'json'
			}
			query = default_parameters.merge(hash)
			query[:sig] = sig(query)
			query
		end


		def sig (hash)
			query_string_parts = []
			hash.each do |k,v|
				query_string_parts << "#{k}=#{URI.encode(v.to_s)}"
			end
			Digest::MD5.hexdigest(query_string_parts.sort.join('') << secret_key)
		end

	end
end
