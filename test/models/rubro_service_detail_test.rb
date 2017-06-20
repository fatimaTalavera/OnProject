require 'test_helper'

class RubroServiceDetailTest < ActiveSupport::TestCase
  test "Should not save rubro service detail without data" do
    rubroServiceDetail = RubroServiceDetail.new()
    assert_not rubroServiceDetail.valid?, "The rubro service detail was not valid. Errors: #{rubroServiceDetail.errors.to_a.to_sentence}"
  end

  test "Should not save rubro service detail without service_id" do
    rubroServiceDetail = RubroServiceDetail.new( quantity: 1, subtotal: 0)
    assert_not rubroServiceDetail.valid?, "The rubro service detail was not valid. Errors: #{rubroServiceDetail.errors.to_a.to_sentence}"
  end

  test "Should not save rubro service detail without quantity" do
    rubroServiceDetail = RubroServiceDetail.new(service_id: 1,subtotal: 0)
    assert_not rubroServiceDetail.valid?, "The rubro service detail was not valid. Errors: #{rubroServiceDetail.errors.to_a.to_sentence}"
  end

  test "Should calculate subtotal rubro service detail" do
    assert_equal(18, RubroServiceDetail.first.calculate_subtotal)
  end

  test "Should update price rubro increment" do
    assert_equal(true, RubroServiceDetail.first.calculate_price)
    assert_equal(501, RubroServiceDetail.first.rubro.price)
  end

  test "Should update price rubro substract" do
    assert_equal(true, RubroServiceDetail.first.sub_to_external_price)
    assert_equal(499, RubroServiceDetail.first.rubro.price)
  end

end
