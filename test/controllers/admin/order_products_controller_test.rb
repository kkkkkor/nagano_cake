require "test_helper"

class Admin::OrderProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get updete" do
    get admin_order_products_updete_url
    assert_response :success
  end
end
