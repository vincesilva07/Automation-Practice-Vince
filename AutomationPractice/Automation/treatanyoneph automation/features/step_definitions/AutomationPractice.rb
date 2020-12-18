Given(/^I am on Automation Practice homepage$/) do
  visit APLoginPage
end

When(/^I try to create account using email address "([^"]*)" on the webpage$/) do |email|
  visit APLoginPage
    on APLoginPage do |page|
      page.create_email(email)
  end
end

When(/^fill out all needed data on the signup forms$/) do
    on APSignupPage do |page|
      page.radiogender_element.click
      page.populate_signup_details
      page.logout_element.click
  end
end

When(/^fill out all needed data using "([^"]*)" Address$/) do |valid_invalid|
    on APAddNewAddress do |page|
    if valid_invalid == "valid"
      page.populate_new_address_details
    else
      page.populate_invalid_address_details
    end
  end
end

And(/^I sign out in the automation practice page$/) do
    on APSignupPage do |page|
      page.user_click_logout
  end
end

When(/^I click link "([^"]*)" on the web page$/) do |link_text|
    @browser.link(:text =>link_text).click
end

When(/^I try to "([^"]*)" my address in my account$/) do |link_text|
    @browser.link(:text =>link_text).click
end

And(/^I login to portal using email "([^"]*)" and password "([^"]*)"$/) do |email,pwd|
  on APLoginPage do |page|
    page.login(email,pwd)
  end
end

Then(/^The message displayed in the URL should be "([^"]*)"$/) do |list_of_strings|
    list_of_strings.split(",").each do |string|
        @browser.windows.last.use
        @browser.url.should include(string)
    end
end

Then(/^There should be a text displayed on the page like "([^"]*)"$/) do |msg|
    @browser.text.should include(msg)
end
