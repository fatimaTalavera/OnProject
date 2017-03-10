require 'test_helper'

class ContractTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup

  end


  test "Should not save a contract without data" do
    contract = Contract.new()
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end
end
