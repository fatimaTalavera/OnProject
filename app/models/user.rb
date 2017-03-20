class User < ApplicationRecord

  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable

  validates :first_name, presence: true, length: {maximum: 30, minimum: 1}
  validates :last_name, presence: true, length: {maximum: 30, minimum: 1}

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: :email_format}
  validates :password, presence: true, confirmation: true, on: :create
  validates :password, length: {maximum: 15, minimum: 8}, on: :create
  validates :password, length: {maximum: 12, minimum: 8}, on: :update, allow_blank: true
  validates_uniqueness_of :email, allow_blank: false

  def full_name
    "#{self.try(:first_name)} #{self.try(:last_name)}"
  end
end
