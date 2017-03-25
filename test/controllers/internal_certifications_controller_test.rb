require 'test_helper'

class InternalCertificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internal_certification = internal_certifications(:one)
  end

  test "should get index" do
    get internal_certifications_url
    assert_response :success
  end

  test "should get new" do
    get new_internal_certification_url
    assert_response :success
  end

  test "should create internal_certification" do
    assert_difference('InternalCertification.count') do
      post internal_certifications_url, params: { internal_certification: { amount: @internal_certification.amount, contract_id: @internal_certification.contract_id, date: @internal_certification.date, discount: @internal_certification.discount, employee_id: @internal_certification.employee_id } }
    end

    assert_redirected_to internal_certification_url(InternalCertification.last)
  end

  test "should show internal_certification" do
    get internal_certification_url(@internal_certification)
    assert_response :success
  end

  test "should get edit" do
    get edit_internal_certification_url(@internal_certification)
    assert_response :success
  end

  test "should update internal_certification" do
    patch internal_certification_url(@internal_certification), params: { internal_certification: { amount: @internal_certification.amount, contract_id: @internal_certification.contract_id, date: @internal_certification.date, discount: @internal_certification.discount, employee_id: @internal_certification.employee_id } }
    assert_redirected_to internal_certification_url(@internal_certification)
  end

  test "should destroy internal_certification" do
    assert_difference('InternalCertification.count', -1) do
      delete internal_certification_url(@internal_certification)
    end

    assert_redirected_to internal_certifications_url
  end
end
