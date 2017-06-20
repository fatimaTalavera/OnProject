require 'test_helper'

class CertificationTest < ActiveSupport::TestCase
  test "Should not save internal certification without data" do
    certification = Certification.new()
    assert_not certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification without contract" do
    certification = Certification.new(date: Date.today)
    assert_not certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end
  test "Should not save internal certification without date" do
    certification = Certification.new(contract: Contract.first)
    assert_not certification.valid?, "The internal certification was not valid. Errors: #{certification.errors.to_a.to_sentence}"
  end

  test "Should update balance, increment balance employee when certification is approved" do
    assert_equal(true, Certification.last.update_balance)
    assert_equal(2200, Certification.last.certification_details.first.employee.balance)
  end
end
