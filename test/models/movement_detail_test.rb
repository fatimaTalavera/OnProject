require 'test_helper'

class MovementDetailTest < ActiveSupport::TestCase
  test "Should not save movement detail without data" do
    movementDetail = MovementDetail.new()
    assert_not movementDetail.valid?, "The movement detail was not valid. Errors: #{movementDetail.errors.to_a.to_sentence}"
  end

  test "Should not save movement detail without material" do
    movementDetail = MovementDetail.new(cantidad: 1, material_movement_id: 1)
    assert_not movementDetail.valid?, "The movement detail was not valid. Errors: #{movementDetail.errors.to_a.to_sentence}"
  end

  test "Should not save movement detail without quantity" do
    movementDetail = MovementDetail.new(material_id: 1, material_movement_id: 1)
    assert_not movementDetail.valid?, "The movement detail was not valid. Errors: #{movementDetail.errors.to_a.to_sentence}"
  end

  test "Should not save movement detail with an invalid quantity" do
    movementDetail = MovementDetail.new(material_id: 1, cantidad: -1, material_movement_id: 1)
    assert_not movementDetail.valid?, "The movement detail was not valid. Errors: #{movementDetail.errors.to_a.to_sentence}"
  end

  test "Should not save movement detail without Material Movement" do
    movementDetail = MovementDetail.new(material_id: 1, cantidad: 1)
    assert_not movementDetail.valid?, "The movement detail was not valid. Errors: #{movementDetail.errors.to_a.to_sentence}"
  end
end
