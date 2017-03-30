require 'test_helper'

class ClientCertificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_certification = client_certifications(:one)
  end

  test "should get index" do
    get client_certifications_url
    assert_response :success
  end

  test "should get new" do
    get new_client_certification_url
    assert_response :success
  end

  test "should create client_certification" do
    assert_difference('ClientCertification.count') do
      post client_certifications_url, params: { client_certification: { client_id: @client_certification.client_id, contract_id: @client_certification.contract_id, date: @client_certification.date, observation: @client_certification.observation, received: @client_certification.received, state: @client_certification.state } }
    end

    assert_redirected_to client_certification_url(ClientCertification.last)
  end

  test "should show client_certification" do
    get client_certification_url(@client_certification)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_certification_url(@client_certification)
    assert_response :success
  end

  test "should update client_certification" do
    patch client_certification_url(@client_certification), params: { client_certification: { client_id: @client_certification.client_id, contract_id: @client_certification.contract_id, date: @client_certification.date, observation: @client_certification.observation, received: @client_certification.received, state: @client_certification.state } }
    assert_redirected_to client_certification_url(@client_certification)
  end

  test "should destroy client_certification" do
    assert_difference('ClientCertification.count', -1) do
      delete client_certification_url(@client_certification)
    end

    assert_redirected_to client_certifications_url
  end
end
