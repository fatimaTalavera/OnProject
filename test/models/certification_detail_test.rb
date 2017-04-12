require 'test_helper'

class CertificationDetailTest < ActiveSupport::TestCase
  test "Should not save internal certification detail without data" do
    certification_detail = CertificationDetail.new()
    assert_not certification_detail.valid?, "The internal certification was not valid. Errors: #{certification_detail.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification detail without employee" do
    certification_detail = CertificationDetail.new(quantity: 1, pay: 99.9, discount: 9.99, observation: 'myString')
    assert_not certification_detail.valid?, "The internal certification was not valid. Errors: #{certification_detail.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification detail without quantity" do
    certification_detail = CertificationDetail.new(employee: Employee.first, pay: 99.9, discount: 9.99, observation: 'myString')
    assert_not certification_detail.valid?, "The internal certification was not valid. Errors: #{certification_detail.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification detail negative quantity" do
    certification_detail = CertificationDetail.new(employee: Employee.first,quantity: -1, pay: 99.9, discount: 9.99, observation: 'myString')
    assert_not certification_detail.valid?, "The internal certification was not valid. Errors: #{certification_detail.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification detail without pay" do
    certification_detail = CertificationDetail.new(employee: Employee.first,quantity: 1, discount: 9.99, observation: 'myString')
    assert_not certification_detail.valid?, "The internal certification was not valid. Errors: #{certification_detail.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification detail negative pay" do
    certification_detail = CertificationDetail.new(employee: Employee.first,quantity: 1, pay: -99.9, discount: 9.99, observation: 'myString')
    assert_not certification_detail.valid?, "The internal certification was not valid. Errors: #{certification_detail.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification detail negative discount" do
    certification_detail = CertificationDetail.new(employee: Employee.first,quantity: 1, pay: 99.9, discount: -9.99, observation: 'myString')
    assert_not certification_detail.valid?, "The internal certification was not valid. Errors: #{certification_detail.errors.to_a.to_sentence}"
  end
end
