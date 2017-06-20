require 'test_helper'

class ClientCertificationTest < ActiveSupport::TestCase
  test "Should not save client certification without data" do
    clientCertification = ClientCertification.new()
    assert_not clientCertification.valid?, "The client certification was not valid. Errors: #{clientCertification.errors.to_a.to_sentence}"
  end

  test "Should not save a client certification without contract" do
    clientCertification = ClientCertification.new(state: 0, date: Date.today, received: 'name', observation: 'Observacion')
    assert_not clientCertification.valid?, "The client certification was not valid. Errors: #{clientCertification.errors.to_a.to_sentence}"
  end

  test "Should not save a client certification without state" do
    clientCertification = ClientCertification.new(contract: Contract.first, date: Date.today, received: 'name', observation: 'Observacion')
    assert_not clientCertification.valid?, "The client certification was not valid. Errors: #{clientCertification.errors.to_a.to_sentence}"
  end

  test "Should not save a client certification without date" do
    clientCertification = ClientCertification.new(contract: Contract.first, state: 0, received: 'name', observation: 'Observacion')
    assert_not clientCertification.valid?, "The client certification was not valid. Errors: #{clientCertification.errors.to_a.to_sentence}"
  end

  test "Should not save a client certification without received" do
    clientCertification = ClientCertification.new(contract: Contract.first, state: 0, date: Date.today, observation: 'Observacion')
    assert_not clientCertification.valid?, "The client certification was not valid. Errors: #{clientCertification.errors.to_a.to_sentence}"
  end

  test "Should not save a client certification invalid received" do
    clientCertification = ClientCertification.new(contract: Contract.first, state: 0, date: Date.today, received: 'Name15', observation: 'Observacion')
    assert_not clientCertification.valid?, "Cannot save a client invalid name. Errors: #{clientCertification.errors.to_a.to_sentence}"
  end

  test "Should update certified_quantity of budget" do
    assert_equal(1, ClientCertification.first.subtract_missing_amount)
    assert_equal(10.5, ClientCertification.first.client_certification_details.first.budget_detail.certified_quantity)
  end

end
