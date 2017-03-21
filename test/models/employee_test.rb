require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "Should not save employee without data" do
    employee = Employee.new()
    assert_not employee.valid?, "The employee was not valid. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee without name" do
    employee = Employee.new(last_name: "last name", address: "address", phone: "205012", identification_document: "123456", email: "email@test.com")
    assert_not employee.valid?, "Cannot save a employee without name. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee without last name" do
    employee = Employee.new(name: "name", address: "address", phone: "205012", identification_document: "123456", email: "email@test.com")
    assert_not employee.valid?, "Cannot save a employee without name. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee without CI" do
    employee = Employee.new(name: "name", last_name: "last name", address: "address", phone: "205012", email: "email@test.com")
    assert_not employee.valid?, "Cannot save a employee without CI. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee with existing phone" do
    employee = Employee.new(name: "name", last_name: "last name", address: "address", phone: "12345", identification_document: "123456", email: "email@test.com")
    assert_not employee.valid?, "Cannot save a employee with existing phone. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee with existing ci" do
    employee = Employee.new(name: "name", last_name: "last name", address: "address", identification_document: "12345", phone: "205012", email: "email@test.com")
    assert_not employee.valid?, "Cannot save a employee with existing ci. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee with existing email" do
    employee = Employee.new(name: "name", last_name: "last name", address: "address", phone: "205012", identification_document: "123456", email: "mail@test.com")
    assert_not employee.valid?, "Cannot save a employee with existing email. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee with invalid name" do
    employee = Employee.new(name: '1231', last_name: "last name", address: "address", phone: "205012", identification_document: "123456", email: "email@test.com")
    assert_not employee.valid?, "Cannot save a employee with invalid name. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee with invalid CI" do
    employee = Employee.new(name: "name", last_name: "last name", address: "address", phone: "205012", identification_document: "adfdf", email: "email@test.com")
    assert_not employee.valid?, "Cannot save a employee with invalid CI. Errors: #{employee.errors.to_a.to_sentence}"
  end

  test "Should not save a employee with invalid email" do
    employee = Employee.new(name: "name", last_name: "last name", address: "address", phone: "205012", identification_document: "123456", email: "email.test.com")
    assert_not employee.valid?, "Cannot save a employee with invalid email. Errors: #{employee.errors.to_a.to_sentence}"
  end
end
