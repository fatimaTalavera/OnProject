class ClientCertificationDetail < ApplicationRecord
  belongs_to :client_certification
  belongs_to :service

  validates :service_id, :presence => {:message => "Debe seleccionar un servicio"}

end
