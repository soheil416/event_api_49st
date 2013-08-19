require_relative '../test_helper'

describe EventApi49st do
	before do
		EventApi49st.configure do |config|
			config.api_key = 'api key'
			config.secret_key = 'Secret Key'
		end
	end

	subject {EventApi49st::Client}

	it "Cannot get response without valid keys" do
		bad_credential = lambda { subject.perform('get_info', {:page => 1, :city => 'Toronto'}) }
		bad_credential.must_raise EventApi49st::APIError
		error = bad_credential.call rescue $!
		error.response['error_code'].must_equal 100
	end

end