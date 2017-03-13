require 'test_helper'

class PurchaseBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_bill = purchase_bills(:one)
  end

  test "should get index" do
    get purchase_bills_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_bill_url
    assert_response :success
  end

  test "should create purchase_bill" do
    assert_difference('PurchaseBill.count') do
      post purchase_bills_url, params: { purchase_bill: { condition: @purchase_bill.condition, date: @purchase_bill.date, number: @purchase_bill.number } }
    end

    assert_redirected_to purchase_bill_url(PurchaseBill.last)
  end

  test "should show purchase_bill" do
    get purchase_bill_url(@purchase_bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_bill_url(@purchase_bill)
    assert_response :success
  end

  test "should update purchase_bill" do
    patch purchase_bill_url(@purchase_bill), params: { purchase_bill: { condition: @purchase_bill.condition, date: @purchase_bill.date, number: @purchase_bill.number } }
    assert_redirected_to purchase_bill_url(@purchase_bill)
  end

  test "should destroy purchase_bill" do
    assert_difference('PurchaseBill.count', -1) do
      delete purchase_bill_url(@purchase_bill)
    end

    assert_redirected_to purchase_bills_url
  end
end
