class ClientCertificationDetail < ApplicationRecord
  audited
  belongs_to :client_certification
  belongs_to :budget_detail

  delegate :rubro_name, :rubro_measurement_unit, to: :budget_detail, prefix: true
  validates :budget_detail_id, :presence => {:message => "Seleccione un rubro"}
  validates :quantity, :presence => {:message => "No puede estar vacio"},
                        :numericality => { :greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :total,   :presence => {:message => "No puede estar en blanco"}


end
