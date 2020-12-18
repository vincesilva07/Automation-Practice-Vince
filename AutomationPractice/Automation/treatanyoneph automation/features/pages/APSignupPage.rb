class APSignupPage
  include PageObject
  include DataMagic
  page_url "#{$portal_url}/index.php?controller=authentication&back=my-account#account-creation"

  radio_button(:radiogender, :id => "id_gender2")
  text_field(:first_name, :id => "customer_firstname")
  text_field(:last_name, :id => "customer_lastname")
  text_field(:password, :id => "passwd")
  select_list(:select_days, :id => "days")
  select_list(:select_months, :id => "months")
  select_list(:select_years, :id => "years")

  text_field(:addfirst_name, :id => "firstname")
  text_field(:addlast_name, :id => "lastname")
  text_field(:address, :id => "address1")
  text_field(:city, :id => "city")
  select_list(:select_state, :id => "id_state")
  text_field(:postcode, :id => "postcode")
  select_list(:select_country, :id => "id_country")
  text_field(:mobile, :id => "phone_mobile")
  button(:click_register, :id => "submitAccount")
  link(:logout, :class => "logout")

  def populate_signup_details(data = {})
      DataMagic.load 'Signup.yml'
      populate_page_with data_for('PersonalUserDetails', data)
      populate_page_with data_for('AddressUserDetails', data)
      @browser.scroll.to :bottom
      self.click_register
      sleep(3)
  end

  def user_click_logout()
    self.logout
    sleep(3)
  end

end
