require "test_helper"

class BookLendsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get book_lends_new_url
    assert_response :success
  end

  test "should get create" do
    get book_lends_create_url
    assert_response :success
  end
end
