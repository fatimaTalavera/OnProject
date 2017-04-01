require 'test_helper'

class MaterialMovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_movement = material_movements(:one)
  end

  test "should get index" do
    get material_movements_url
    assert_response :success
  end

  test "should get new" do
    get new_material_movement_url
    assert_response :success
  end

  test "should create material_movement" do
    assert_difference('MaterialMovement.count') do
      post material_movements_url, params: { material_movement: { date: @material_movement.date, reason: @material_movement.reason } }
    end

    assert_redirected_to material_movement_url(MaterialMovement.last)
  end

  test "should show material_movement" do
    get material_movement_url(@material_movement)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_movement_url(@material_movement)
    assert_response :success
  end

  test "should update material_movement" do
    patch material_movement_url(@material_movement), params: { material_movement: { date: @material_movement.date, reason: @material_movement.reason } }
    assert_redirected_to material_movement_url(@material_movement)
  end

  test "should destroy material_movement" do
    assert_difference('MaterialMovement.count', -1) do
      delete material_movement_url(@material_movement)
    end

    assert_redirected_to material_movements_url
  end
end
