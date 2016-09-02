require 'rspec'

require 'watir_tumblr'

RSpec.configure do|config|
	config.color = true
	config.tty = true
	config.formatter = :documentation
end