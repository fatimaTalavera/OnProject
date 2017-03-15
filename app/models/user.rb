class User < ApplicationRecord
  paginates_per 2
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: :email_format}
  validates :password, presence: true, on: :create
  validates :password, length: {maximum: 15, minimum: 8}, presence: true, on: :create
  validates :password, length: {maximum: 12, minimum: 8}, presence: true, on: :update, allow_blank: true
  validates_uniqueness_of :email, allow_blank: false
end
