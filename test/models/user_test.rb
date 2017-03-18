require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "Users count" do
    assert_equal 1, User.count
  end

  test "Find a user" do
    assert_equal "first_name", users(:one).first_name
  end

  test "Should not save user without data" do
    user = User.new()
    assert_not user.save, "Saved the user without a data"
  end

  test "Should not save a user without first_name and last_name" do
    user = User.new(email: "email@email.com", encrypted_password: "12341234")
    assert_not user.save, "Saved the user without a first_name and last_name"
  end

  test "Should not save a user without email" do
    user = User.new(first_name: "name", last_name: "last_name", encrypted_password: "12341234")
    assert_not user.save, "Saved the user without a email"
  end

  test "Should not save a user with an email that already exists" do
    user = User.new(email: "one@email.com", encrypted_password: "12341234", first_name: "name", last_name: "last_name")
    assert_not user.save, "Saved the user with an email already exists"
  end

end
