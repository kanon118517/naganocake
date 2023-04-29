require "test_helper"

class CustmersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get custmers_show_url
    assert_response :success
  end

  test "should get edit" do
    get custmers_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get custmers_confirm_url
    assert_response :success
  end
end
