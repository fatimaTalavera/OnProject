require 'test_helper'

class MaterialMovementTest < ActiveSupport::TestCase
  test "Should not save material movement without data" do
    materialMovement = MaterialMovement.new()
    assert_not materialMovement.valid?, "The material movement was not valid. Errors: #{materialMovement.errors.to_a.to_sentence}"
  end

  test "Should save material movement without motivo" do
    materialMovement = MaterialMovement.new(fecha: '01-01-2000')
    assert materialMovement.valid?, "The material movement is valid"
  end

  test "Should not save material movement without a valid contract" do
    materialMovement = MaterialMovement.new(fecha: '01-01-2000', contract_id: 1234)
    assert_not materialMovement.valid?, "The material movement was not valid. Errors: #{materialMovement.errors.to_a.to_sentence}"
  end

end
