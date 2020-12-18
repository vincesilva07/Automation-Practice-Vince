class APAddNewAddress
  include PageObject
  include DataMagic

  text_field(:address, :id => "address1")
  text_field(:city, :id => "city")
  select_list(:select_state, :id => "id_state")
  text_field(:postcode, :id => "postcode")
  text_field(:homephone, :id => "phone")
  text_field(:mobile, :id => "phone_mobile")
  text_field(:alias, :id => "alias")
  button(:click_save, :id => "submitAddress")

  def populate_new_address_details(data = {})
      DataMagic.load 'AddNewAddress.yml'
      populate_page_with data_for('AddNewAddressDetails', data)
      self.click_save
      sleep(3)
  end

  def populate_invalid_address_details(data = {})
      DataMagic.load 'AddNewAddress.yml'
      populate_page_with data_for('InvalidAddressDetails', data)
      self.click_save
      sleep(3)
  end

end
