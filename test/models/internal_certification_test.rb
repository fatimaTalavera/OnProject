require 'test_helper'

class InternalCertificationTest < ActiveSupport::TestCase
  test "Should not save a internal certification without data" do
    certification = InternalCertification.new()
    assert_not certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end

  test "Should not save a internal certification without contract" do
    certification = InternalCertification.new(employee_id: 1, amount: 10000, date: '01/01/2000', discount: 0)
    assert_not certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end

  test "Should not save a internal certification without employee" do
    certification = InternalCertification.new(contract_id: 1, amount: 10000, date: '01/01/2000', discount: 0)
    assert_not certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end

  test "Should not save a internal certification without amount" do
    certification = InternalCertification.new(employee_id: 1, contract_id: 1, date: '01/01/2000', discount: 0)
    assert_not certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end

  test "Should save a internal certification without date" do
    certification = InternalCertification.new(employee_id: 1, contract_id: 1, amount: 10000, discount: 0)
    assert certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end

  test "Should save a internal certification without discount" do
    certification = InternalCertification.new(employee_id: 1, contract_id: 1, date: '01/01/2000', amount: 10000)
    assert certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end
end
