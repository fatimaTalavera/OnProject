# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email
@superuser = User.new first_name: 'Super', last_name: 'Admin', email: 'admin@admin.com', password: '12341234'
@superuser.skip_confirmation!
@superuser.save!

# Datos por defecto para la empresa
if CompanyConfig.first.nil?
  @company_config = CompanyConfig.new name: 'ON', address: 'Encarnación', tel_fax: '(000) 000 000', celphone: '(0000) 000 000', email: 'email@email.com', avatar: ''
  @company_config.save!
end
