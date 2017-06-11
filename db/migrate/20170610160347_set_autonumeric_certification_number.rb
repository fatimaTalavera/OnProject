class SetAutonumericCertificationNumber < ActiveRecord::Migration[5.0]
  def change
    execute "CREATE SEQUENCE certification_number_seq START 1;"
    execute "ALTER TABLE certifications ALTER COLUMN certification_number SET DEFAULT nextval('certification_number_seq'::regclass);"
  end
end
