class APLoginPage
  include PageObject
  page_url "#{$portal_url}/index.php?controller=authentication&back=my-account"

  #initialize pageobjects
  link(:Signin, :class => "login")
  text_field(:create_account, :id => "email_create")
  button(:create_button, :id => "SubmitCreate")
  text_field(:email_address, :id => "email")
  text_field(:password, :id => "passwd")
  button(:login_button, :id => "SubmitLogin")


  def create_email(email)
    self.create_account = email
    self.create_button
    sleep(3)
  end

  def login(username,pwd)
    self.email_address = username
    self.password = pwd
    self.login_button
    sleep(3)
  end

end
