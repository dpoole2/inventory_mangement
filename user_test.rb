require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Testing by Erik Eskeland

  test "User creation" do
    User.create(first_name: "Tom", password_salt: "123")
    user = User.last
    assert user.first_name == "Tom" && user.password_salt == "123"
  end

  test "User Deletion" do
    User.create(first_name: "Tom", password_salt: "123")
    user = User.last
    User.last.destroy
    assert !User.find(user).present?
  end

  test "Authentication method" do
    User.create(first_name: "Tom", email: "Tom@gmail.com", password_salt: "123")
    user = User.last
    user_test = User.authenticate("Tom@gmail.com", "123")
    assert user.first_name == user_test.first_name
  end


end
