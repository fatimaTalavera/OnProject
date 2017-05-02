class ClientCertificationDetail < ApplicationRecord
  audited
  belongs_to :client_certification
  belongs_to :rubro

  delegate :name, to: :rubro, prefix: true

  validates :rubro_id, :presence => {:message => "Seleccione un rubro"}
  validates :quantity, :presence => {:message => "No puede estar vacio"},
                        :numericality => { :greater_than_or_equal_to => 0, message: "No puede ser negativo"}
end
