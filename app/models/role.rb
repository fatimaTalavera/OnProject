class Role < ApplicationRecord
  has_many :users
  has_many :permissions, :dependent => :delete_all
  accepts_nested_attributes_for :permissions, allow_destroy: true

  validates :name , presence: true,length: {maximum: 35}, uniqueness: {message: "El nombre ya esta siendo utilizado"}
  validates :description, length: {maximum: 150}, allow_blank: true

end
