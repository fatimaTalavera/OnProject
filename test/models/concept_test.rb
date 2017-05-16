require 'test_helper'

class ConceptTest < ActiveSupport::TestCase
  test "Should not save a concept without data" do
    concept = Concept.new()
    assert_not concept.valid?, "The concept was not valid. Errors: #{concept.errors.to_a.to_sentence}"
  end
  test "Should not save a concept invalid name" do
    concept = Concept.new(name: "name54")
    assert_not concept.valid?, "Cannot save a concept invalid name. Errors: #{concept.errors.to_a.to_sentence}"
  end
end
