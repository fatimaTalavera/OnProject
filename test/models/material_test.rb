require 'test_helper'

class MaterialTest < ActiveSupport::TestCase

  test "Should not save material without data" do
    material = Material.new()
    assert_not material.valid?, "The material was not valid. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material without name" do
    material = Material.new(description: "description", price: 9.99, quantity: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material without name. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material without description" do
    material = Material.new(name: "name", price: 9.99, quantity: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material without description. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material without price" do
    material = Material.new(name: "name", description: "description", quantity: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material without price. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material without quantity" do
    material = Material.new(name: "name", description: "description", price: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material without quantity. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material without measurement_unit" do
    material = Material.new(name: "name", description: "description", price: 9.99, quantity: 9.99, minimun_stock: 1)
    assert_not material.valid?, "Cannot save a material without measurement_unit. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material with existing name" do
    material = Material.new(name: "myName", description: "description", price: 9.99, quantity: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with existing name. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material with existing description" do
    material = Material.new(name: "name", description: "otherDescription", price: 9.99, quantity: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with existing description. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material with negative price" do
    material = Material.new(name: "name", description: "description", price: -2.0, quantity: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with negative price. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material with negative quantity" do
    material = Material.new(name: "name", description: "description", price: 9.99, quantity: -2.0, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with negative quantity. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material with negative minimun stock" do
    material = Material.new(name: "name", description: "description", price: 9.99, quantity: 9.99, minimun_stock: -1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with negative minimun stock. Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material with invalid price" do
    material = Material.new(name: "name", description: "description", price: '9a', quantity: 9.99, minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with invalid price . Errors: #{material.errors.to_a.to_sentence}"
  end

  test "Should not save a material with invalid quantity" do
    material = Material.new(name: "name", description: "description", price: 9.99, quantity: '9a', minimun_stock: 1, measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with invalid quantity . Errors: #{material.errors.to_a.to_sentence}"
  end


  test "Should not save a material with invalid minimun stock" do
    material = Material.new(name: "name", description: "description", price: 9.99, quantity: 9.9, minimun_stock: '9a', measurement_unit: "m")
    assert_not material.valid?, "Cannot save a material with invalid minimun stock . Errors: #{material.errors.to_a.to_sentence}"
  end

end
