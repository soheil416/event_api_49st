require_relative '../test_helper'

describe EventApi49st do
	before do
		EventApi49st.configure do |config|
			config.api_key = 'api key'
			config.secret_key = 'Secret Key'
		end
	end

	subject {EventApi49st}

	it "API key must be String" do
		subject.api_key.must_be_instance_of(String)
	end

	it "API key must be equal to 'api key'" do
		subject.api_key.must_equal('api key')
	end

	it "Secret Key must be equal to 'secret key'" do
		subject.secret_key.must_equal('Secret Key')
	end

end