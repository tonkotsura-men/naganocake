require 'test_helper'

class Publics::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get publics_addresses_edit_url
    assert_response :success
  end

end
