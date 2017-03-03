class Client < ApplicationRecord
  has_many :contracts
  def full_name
    "#{name} #{last_name}"
  end
end
