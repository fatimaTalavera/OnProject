require 'test_helper'

class MovementDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movement_detail = movement_details(:one)
  end

  test "should get index" do
    get movement_details_url
    assert_response :success
  end

  test "should get new" do
    get new_movement_detail_url
    assert_response :success
  end

  test "should create movement_detail" do
    assert_difference('MovementDetail.count') do
      post movement_details_url, params: { movement_detail: { cantidad: @movement_detail.cantidad, material_movement_id: @movement_detail.material_movement_id } }
    end

    assert_redirected_to movement_detail_url(MovementDetail.last)
  end

  test "should show movement_detail" do
    get movement_detail_url(@movement_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_movement_detail_url(@movement_detail)
    assert_response :success
  end

  test "should update movement_detail" do
    patch movement_detail_url(@movement_detail), params: { movement_detail: { cantidad: @movement_detail.cantidad, material_movement_id: @movement_detail.material_movement_id } }
    assert_redirected_to movement_detail_url(@movement_detail)
  end

  test "should destroy movement_detail" do
    assert_difference('MovementDetail.count', -1) do
      delete movement_detail_url(@movement_detail)
    end

    assert_redirected_to movement_details_url
  end
end
