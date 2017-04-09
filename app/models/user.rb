class User < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  belongs_to :role
  delegate :name, :to => :role, :prefix => true

  if Rails.env.development?
    mount_uploader :avatar, AvatarUploader # localhost
  else
    mount_uploader :avatar, CloudinaryUploader #Para produccion
    validate :valid_content_type
  end

  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable

  validates :first_name, presence: true, length: {maximum: 30, minimum: 1}
  validates :last_name, presence: true, length: {maximum: 30, minimum: 1}

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: :email_format}
  validates :password, presence: true, confirmation: true, on: :create
  validates :password, length: {maximum: 15, minimum: 8}, on: :create
  validates :password, length: {maximum: 12, minimum: 8}, on: :update, allow_blank: true
  validates_uniqueness_of :email, allow_blank: false
  validates :role_id , presence: true
  validate :avatar_size_validation

  def full_name
    "#{self.try(:first_name)} #{self.try(:last_name)}"
  end

  private
    def avatar_size_validation
      errors[:avatar] << "La imagen no puede superar 1MB" if avatar.size > 1.megabytes
    end

    def valid_content_type
       errors[:avatar] << "El formato de la imagen es inválido" unless %w(image/jpeg image/png image/gif).include? avatar.sanitized_file.content_type
    end

end
