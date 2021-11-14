require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "test categories" do
    puts Book.last.name
    assert_equal 'MyString2', Book.last.name
  end
end
