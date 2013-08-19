# EventApi49st

A Ruby library for adding local events, venues (restaurants, clubs, etc.) to your web and apps.

## Install

    gem install event_api_49st


## Examples

	begin
		EventApi49st.configure do |config|
			config.api_key = 'your api key'
			config.secret_key = 'your secret key'
		end

		result = EventApi49st::Client.perform('get_info', {:url => '/event/tim-burton-exhibition-and-retrospective', :image_size => 'small'})

	rescue EventApi49st::APIError => e
		puts 'Got error:' << e.to_s
	end
See the [examples directory](https://github.com/soheil416/event_api_49st/examples) for even more goodies.

## Documentation

Please visit [http://www.49st.com/developer](http://www.49st.com/developer)