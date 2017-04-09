require 'test_helper'

class RubroTest < ActiveSupport::TestCase
  test "Should not save rubro without data" do
    rubro = Rubro.new()
    assert_not rubro.valid?, "The rubro was not valid. Errors: #{rubro.errors.to_a.to_sentence}"
  end

  test "Should not save rubro without utility" do
    rubro = Rubro.new(name: "test", price: 0)
    assert_not rubro.valid?, "The rubro was not valid. Errors: #{rubro.errors.to_a.to_sentence}"
  end

  test "Should not save rubro without name" do
    rubro = Rubro.new(utility: 11.1, price: 0)
    assert_not rubro.valid?, "The rubro was not valid. Errors: #{rubro.errors.to_a.to_sentence}"
  end

  test "Should save rubro without price" do
    rubro = Rubro.new(name: "test", utility: 11.1)
    assert rubro.valid?, "The rubro was not valid. Errors: #{rubro.errors.to_a.to_sentence}"
  end
end
