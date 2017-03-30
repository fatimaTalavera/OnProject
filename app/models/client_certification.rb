class ClientCertification < ApplicationRecord
  belongs_to :client
  belongs_to :contract
  delegate :name, to: :client, prefix: true
  delegate :name, to: :contract, prefix: true
end
