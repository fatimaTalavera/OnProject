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

  test "Should save rubro service detail without subtotal" do
    rubroServiceDetail = RubroServiceDetail.new(service_id: 1, quantity: 1,measurement_unit:'m' )
    assert_not rubroServiceDetail.valid?, "The rubro service detail was not valid. Errors: #{rubroServiceDetail.errors.to_a.to_sentence}"
  end
end
