require 'test_helper'

class RubroMaterialDetailTest < ActiveSupport::TestCase

  test "Should not save rubro material detail without data" do
    rubroMaterialDetail = RubroMaterialDetail.new()
    assert_not rubroMaterialDetail.valid?, "The rubro material detail was not valid. Errors: #{rubroMaterialDetail.errors.to_a.to_sentence}"
  end

  test "Should not save rubro material detail without quantity" do
    rubroMaterialDetail = RubroMaterialDetail.new(material: Material.first,rubro: Rubro.first, measurement_unit: 'm2', price: 100)
    assert_not rubroMaterialDetail.valid?, "The rubro material detail was not valid. Errors: #{rubroMaterialDetail.errors.to_a.to_sentence}"
  end

  test "Should calculate subtotal rubro material detail" do
    assert_equal(9, RubroMaterialDetail.first.calculate_subtotal)
  end

  test "Should update calculate price rubro" do
    assert_equal(true, RubroMaterialDetail.first.calculate_price)
    assert_equal(501, RubroMaterialDetail.first.rubro.price)
  end

  test "Should update calculate price rubro external" do
    assert_equal(true, RubroMaterialDetail.first.sub_to_external_price)
    assert_equal(499, RubroMaterialDetail.first.rubro.price)
  end
end