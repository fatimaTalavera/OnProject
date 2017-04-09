require 'test_helper'

class RubroMaterialDetailTest < ActiveSupport::TestCase
  test "Should not save rubro material detail without data" do
    rubroMaterialDetail = RubroMaterialDetail.new()
    assert_not rubroMaterialDetail.valid?, "The rubro material detail was not valid. Errors: #{rubroMaterialDetail.errors.to_a.to_sentence}"
  end

  test "Should not save rubro material detail without material_id" do
    rubroMaterialDetail = RubroMaterialDetail.new( quantity: 1, subtotal: 0)
    assert_not rubroMaterialDetail.valid?, "The rubro material detail was not valid. Errors: #{rubroMaterialDetail.errors.to_a.to_sentence}"
  end

  test "Should not save rubro material detail without quantity" do
    rubroMaterialDetail = RubroMaterialDetail.new(material_id: 1,subtotal: 0)
    assert_not rubroMaterialDetail.valid?, "The rubro material detail was not valid. Errors: #{rubroMaterialDetail.errors.to_a.to_sentence}"
  end

  test "Should save rubro material detail without subtotal" do
    rubroMaterialDetail = RubroMaterialDetail.new(material_id: 1, quantity: 1)
    assert rubroMaterialDetail.valid?, "The rubro material detail was not valid. Errors: #{rubroMaterialDetail.errors.to_a.to_sentence}"
  end
end
