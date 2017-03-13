require 'test_helper'

class MaterialMovementTest < ActiveSupport::TestCase
  test "Should not save material movement without data" do
    materialMovement = MaterialMovement.new()
    assert_not materialMovement.valid?, "The material movement was not valid. Errors: #{materialMovement.errors.to_a.to_sentence}"
  end
end
