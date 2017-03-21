require 'test_helper'

class ProviderTest < ActiveSupport::TestCase

  test "Should not save provider without data" do
    provider = Provider.new()
    assert_not provider.valid?, "The provider was not valid. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider without name" do
    provider = Provider.new(address: "address", phone: "205012", ruc: "1234456-1", email: "email@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider without name. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider without ruc" do
    provider = Provider.new(name: "name", address: "address", phone: "205012", email: "email@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider without RUC. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider with existing phone" do
    provider = Provider.new(name: "name", address: "address", phone: "205020", ruc: "1234456-1", email: "email@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider with existing name. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider with existing RUC" do
    provider = Provider.new(name: "name",address: "address", phone: "205012", ruc: "1234456-2", email: "email@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider with existing RUC. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider with existing email" do
    provider = Provider.new(name: "name", address: "address", phone: "205012", ruc: "1234456-1", email: "mail@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider with existing email. Errors: #{provider.errors.to_a.to_sentence}"
  end


  test "Should not save a provider with invalid name" do
    provider = Provider.new(name: '1231', address: "address", phone: "205012", ruc: "1234456-1", email: "email@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider with invalid name. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider with invalid phone" do
    provider = Provider.new(name: "name", address: "address", phone: "adfdf", ruc: "1234456-1", email: "email@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider with invalid phone. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider with invalid ruc" do
    provider = Provider.new(name: "name", address: "address", phone: "205012", ruc: "adfdf", email: "email@test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider with invalid ruc. Errors: #{provider.errors.to_a.to_sentence}"
  end

  test "Should not save a provider with invalid email" do
    provider = Provider.new(name: "name", address: "address", phone: "205012", ruc: "1234456-1", email: "email.test.com", state: TRUE, balance: 1.00)
    assert_not provider.valid?, "Cannot save a provider with invalid email. Errors: #{provider.errors.to_a.to_sentence}"
  end
end