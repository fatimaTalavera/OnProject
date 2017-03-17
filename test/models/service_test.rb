require 'test_helper'

class ServiceTest < ActiveSupport::TestCase

  test "Should not save service without data" do
    service = Service.new()
    assert_not service.valid?, "The service was not valid. Errors: #{service.errors.to_a.to_sentence}"
  end

  test "Should not save a service without name" do
    service = Service.new(description: "description", measurement_unit: "m")
    assert_not service.valid?, "Cannot save a service without name. Errors: #{service.errors.to_a.to_sentence}"
  end

  test "Should not save a service without description" do
    service = Service.new(name: "MyName", price: 9.99, measurement_unit: "m")
    assert_not service.valid?, "Cannot save a service without description. Errors: #{service.errors.to_a.to_sentence}"
  end

  test "Should not save a service without price" do
    service = Service.new(name: "name", description: "description", measurement_unit: "m")
    assert_not service.valid?, "Cannot save a service without price. Errors: #{service.errors.to_a.to_sentence}"
  end

  test "Should not save a service without measurement_unit" do
    service = Service.new(name: "name", description: "description", price: 9.99)
    assert_not service.valid?, "Cannot save a service without measurement_unit. Errors: #{service.errors.to_a.to_sentence}"
  end

  test "Should not save a service with existing name" do
    service = Service.new(name: "myName", description: "description", price: 9.99, measurement_unit: "m")
    assert_not service.valid?, "Cannot save a service with existing name. Errors: #{service.errors.to_a.to_sentence}"
  end

  test "Should not save a service with negative price" do
    service = Service.new(name: "name", description: "description", price: -2.0, measurement_unit: "m")
    assert_not service.valid?, "Cannot save a service with negative price. Errors: #{service.errors.to_a.to_sentence}"
  end

  test "Should not save a service with invalid price" do
    service = Service.new(name: "name", description: "description", price: '9a', measurement_unit: "m")
    assert_not service.valid?, "Cannot save a service with invalid price . Errors: #{service.errors.to_a.to_sentence}"
  end

end
