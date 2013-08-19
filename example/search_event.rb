require '../lib/event_api_49st'
require 'pp'

begin
	EventApi49st.configure do |config|
		config.api_key = 'your api key'
		config.secret_key = 'your secret key'
	end


	result = EventApi49st::Client.perform('search_event', {:country => 'CA', 'prov-state' =>'ON', :city =>'toronto'})
	pp(result)

rescue EventApi49st::APIError => e
	puts 'Got error:' << e.to_s
end