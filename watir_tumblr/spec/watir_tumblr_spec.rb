require 'spec_helper'
require 'watir-webdriver'

describe "Tumblr" do	
	it "should log in to my Tumblr account" do
		login
		#Expected Result
		expect(@url).to eq "https://www.tumblr.com/dashboard"
	end
	it "should show a message when logging in with an email with invalid format" do
		login_invalid_format_email
		#Expected Result
		expect(@error_message).to eq true
	end
	it "should show a message when logging in with an email that doesn't exist" do
		login__email_doesnt_exist
		#Expected Result
		expect(@error_message).to eq true
	end
	it "should show a meassage when using the wrong password to log in" do
		login_wrong_password
		#Expected Result
		expect(@error_message).to eq true
	end
	it "should post a text post" do
		create_text_post
		#Expected Result
		expect(@posted).to eq true
	end
end