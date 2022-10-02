require "test_helper"

class Piblic::ShippingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get piblic_shipping_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get piblic_shipping_addresses_edit_url
    assert_response :success
  end

  test "should get create" do
    get piblic_shipping_addresses_create_url
    assert_response :success
  end

  test "should get update" do
    get piblic_shipping_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get piblic_shipping_addresses_destroy_url
    assert_response :success
  end
end
