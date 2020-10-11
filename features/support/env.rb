require 'cucumber'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'net/http'
require 'rack/test'
require 'test/unit/assertions'

ENV['TZ'] = 'UTC'

if ENV['browser'].eql?('chrome')
  Capybara.default_driver = :selenium
  Capybara.default_max_wait_time = 10
  chromeDriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)), 'webdrivers/windows', 'chromedriver.exe')

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, driver_path: chromeDriver_path)
  end

elsif ENV['browser'].eql?('firefox')
  Capybara.default_driver = :selenium
  Capybara.default_max_wait_time = 10
  FirefoxDriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)), 'webdrivers/windows', 'geckodriver.exe')

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox, driver_path: FirefoxDriver_path)
  end

elsif ENV['browser'].eql?('headless')

  Capybara.default_max_wait_time = 20
  Capybara.default_driver = :headless_chrome
  Capybara.javascript_driver = :headless_chrome
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  chromeDriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)), 'webdrivers/windows', 'chromedriver.exe')

  Capybara.register_driver :headless_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument 'headless'
    options.add_argument 'disable-popup-blocking'
    options.add_argument 'no-sandbox'

    Capybara::Selenium::Driver.new app, browser: :chrome, options: options, driver_path: chromeDriver_path
  end
end