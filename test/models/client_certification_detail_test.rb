require 'test_helper'

class ClientCertificationDetailTest < ActiveSupport::TestCase
  test 'Should not save client certification detail without data' do
    client_certification_detail = ClientCertificationDetail.new()
    assert_not client_certification_detail.valid?, "The client certification was not valid. Errors: #{client_certification_detail.errors.to_a.to_sentence}"
  end
  test 'Should not save client certification detail without rubro' do
    client_certification_detail = ClientCertificationDetail.new(price: 1, quantity: 1, total: 2000)
    assert_not client_certification_detail.valid?, "Cannot save client certification detail without rubro. Errors: #{client_certification_detail.errors.to_a.to_sentence}"
  end
  test 'Should not save client certification detail without quantity' do
    client_certification_detail = ClientCertificationDetail.new(rubro: Rubro.first, price: 1, total: 2000)
    assert_not client_certification_detail.valid?, "The client certification was not valid. Errors: #{client_certification_detail.errors.to_a.to_sentence}"
  end
  test 'Should not save client certification detail negative quantity' do
    client_certification_detail = ClientCertificationDetail.new(rubro: Rubro.first, quantity: -1, price: 1, total: 2000)
    assert_not client_certification_detail.valid?, "The client certification was not valid. Errors: #{client_certification_detail.errors.to_a.to_sentence}"
  end
end
