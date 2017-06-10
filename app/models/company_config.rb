class CompanyConfig < ApplicationRecord
  audited
  require 'carrierwave/orm/activerecord'
  #if Rails.env.development?
  #  mount_uploader :avatar, AvatarUploader # localhost
  #else
  mount_uploader :avatar, CloudinaryUploader #Para produccion
  validate :valid_content_type
  #end

  validates :name, presence: true, length: {maximum: 40, minimum: 2}
	validates :address, presence: true, length: {maximum: 200}
	validates :celphone, length: {maximum: 15}
  validates :tel_fax, length: {maximum: 14}
	validates :email, length: {maximum: 30}, format: { with: VALID_EMAIL_REGEX, message: :email_format}
  validates :letterhead, presence: true, format: { with: VALID_LETTER_HEAD_REGEX, message: "Debe ser un número de 8 dígitos"}
  validates :validity_of_letterhead, presence: true
  validates :current_pay, presence: true
  validates :default_utility, presence: true
  validate :avatar_size_validation

  private
    def avatar_size_validation
      errors[:avatar] << "La imagen no puede superar 1MB" if avatar.size > 1.megabytes
    end

    def valid_content_type
      if not avatar.filename == current_avatar
        errors[:avatar] << "El formato de la imagen es inválido" unless %w(image/jpeg image/png image/gif).include? avatar.sanitized_file.content_type
        self.current_avatar = avatar.filename
      end
    end

end
