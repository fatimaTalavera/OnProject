require 'test_helper'

class ContractTest < ActiveSupport::TestCase

  test "Should not save a contract without data" do
    contract = Contract.new()
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

  test "Should not save a contract without client" do
    contract = Contract.new(start_date: Date.today, end_date: Date.today, name: "name", amount: 5000 )
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

  test "Should not save a contract without start date" do
    contract = Contract.new(client: Client.first, end_date: Date.today, name: "name", amount: 5000 )
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

  test "Should not save a contract without end date" do
    contract = Contract.new(client: Client.first, start_date: Date.today, name: "name", amount: 5000 )
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

  test "Should not save a contract without name" do
    contract = Contract.new(client: Client.first, start_date: Date.today, end_date: Date.today, amount: 5000 )
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

  test "Should not save a contract if name already exists" do
    contract = Contract.new(client: Client.first, start_date: Date.today, end_date: Date.today, name: "MyString", amount: 5000 )
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

  test "Should not save a contract without amount" do
    contract = Contract.new(client: Client.first, start_date: Date.today, end_date: Date.today, name: "name" )
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

  test "Should not save a contract with negative amount" do
    contract = Contract.new(client: Client.first, start_date: Date.today, end_date: Date.today, name: "name", amount: -5000 )
    assert_not contract.valid?, "The contract was not valid. Errors: #{contract.errors.to_a.to_sentence}"
  end

end
