require 'test_helper'

class SaleBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_bill = sale_bills(:one)
  end

  test "should get index" do
    get sale_bills_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_bill_url
    assert_response :success
  end

  test "should create sale_bill" do
    assert_difference('SaleBill.count') do
      post sale_bills_url, params: { sale_bill: { client_id: @sale_bill.client_id, condition: @sale_bill.condition, date: @sale_bill.date, number: @sale_bill.number, total: @sale_bill.total } }
    end

    assert_redirected_to sale_bill_url(SaleBill.last)
  end

  test "should show sale_bill" do
    get sale_bill_url(@sale_bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_bill_url(@sale_bill)
    assert_response :success
  end

  test "should update sale_bill" do
    patch sale_bill_url(@sale_bill), params: { sale_bill: { client_id: @sale_bill.client_id, condition: @sale_bill.condition, date: @sale_bill.date, number: @sale_bill.number, total: @sale_bill.total } }
    assert_redirected_to sale_bill_url(@sale_bill)
  end

  test "should destroy sale_bill" do
    assert_difference('SaleBill.count', -1) do
      delete sale_bill_url(@sale_bill)
    end

    assert_redirected_to sale_bills_url
  end
end
