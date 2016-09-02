require 'watir-webdriver'

def login
	#Declare yaml variable
	#unames_pwords = YAML.load_file("usernamepasswordcomb.yml")

	#Open Tumblr login in chrome
	browser = Watir::Browser.new :chrome
	browser.goto "https://www.tumblr.com/login"

	#Enter email and password
	browser.input(:id => "signup_determine_email").when_present.click
	browser.send_keys "sharad182@hotmail.com\n"
	browser.input(:id => "signup_password").when_present.click
	browser.send_keys "sharadtumblr\n"
	@url = browser.url
	browser.quit
end

def login_invalid_format_email
	#Open Tumblr login in chrome
	browser = Watir::Browser.new :chrome
	browser.goto "https://www.tumblr.com/login"

	#Enter email and password
	browser.input(:id => "signup_determine_email").when_present.click
	browser.send_keys "sharad182hotmail.com\n"
	
	#Check error message
	browser.li(:class => "error").wait_until_present
	@error_message = browser.li(:class => "error").present?
	browser.quit
end

def login__email_doesnt_exist
	#Open Tumblr login in chrome
	browser = Watir::Browser.new :chrome
	browser.goto "https://www.tumblr.com/login"

	#Enter email and password
	browser.input(:id => "signup_determine_email").when_present.click
	browser.send_keys "sharad182@gmail.com\n"

	#Check error message
	browser.li(:class => "error").wait_until_present
	@error_message = browser.li(:class => "error").present?
	browser.quit
end

def login_wrong_password
	#Open Tumblr login in chrome
	browser = Watir::Browser.new :chrome
	browser.goto "https://www.tumblr.com/login"

	#Enter email and password
	browser.input(:id => "signup_determine_email").when_present.click
	browser.send_keys "sharad182@hotmail.com\n"
	browser.input(:id => "signup_password").when_present.click
	browser.send_keys "tumblr\n"

	#Check error message
	browser.ul(:class => "signup_forms_errors").wait_until_present
	@error_message = browser.li(:class => "error").present?
	browser.quit
end

def create_text_post
	#Open Tumblr login in chrome
	browser = Watir::Browser.new :chrome
	browser.goto "https://www.tumblr.com/login"

	#Enter email and password from yaml file
	browser.input(:id => "signup_determine_email").when_present.click
	browser.send_keys "sharad182@hotmail.com\n"
	browser.input(:id => "signup_password").when_present.click
	browser.send_keys "sharadtumblr\n"

	#Create text post
	browser.button(:class => "compose-button").when_present.click
	browser.div(:class => "post-type-icon icon-text").when_present.click
	browser.div(:class => "editor editor-plaintext").wait_until_present
	browser.div(:class => "editor editor-plaintext").click 
	browser.send_keys "My First Tumblr Post"
	browser.div(:class => "editor editor-richtext").click
	range = [*'0'..'9',*'A'..'Z',*'a'..'z']
	text = Array.new(100){ range.sample }.join
	browser.send_keys text
	browser.div(:class => "post-form--tag-editor").click 
	browser.send_keys "Selenium, Watir, Automation,"
	browser.button(:class => "button-area create_post_button").click

	#Check post
	@posted = browser.text.include?(text)

	browser.quit
end