class Permission < ApplicationRecord
  default_scope { order(subject_class: :asc) }
  belongs_to :role
end
