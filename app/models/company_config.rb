class CompanyConfig < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  if Rails.env.development?
    mount_uploader :avatar, AvatarUploader # localhost
  else
    mount_uploader :avatar, CloudinaryUploader #Para produccion
    validate :valid_content_type
  end

  validates :name, presence: true, length: {maximum: 40, minimum: 2}
	validates :address, presence: true, length: {maximum: 200}
	validates :celphone, length: {maximum: 15}
  validates :tel_fax, length: {maximum: 14}
	validates :email, length: {maximum: 30}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: :email_format}
  validate :avatar_size_validation

  private
    def avatar_size_validation
      errors[:avatar] << "La imagen no puede superar 1MB" if avatar.size > 1.megabytes
    end

    def valid_content_type
       errors[:avatar] << "El formato de la imagen es inválido" unless %w(image/jpeg image/png image/gif).include? avatar.sanitized_file.content_type
    end

end
