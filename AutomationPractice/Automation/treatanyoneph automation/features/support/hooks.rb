Before do
  browser = Watir::Browser.new :firefox
  @browser=browser
  @browser.driver.manage.window.maximize
end

After do
		@browser.quit
end
