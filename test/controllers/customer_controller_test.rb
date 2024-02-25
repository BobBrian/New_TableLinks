require "test_helper"

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get customer_home_url
    assert_response :success
  end
end
