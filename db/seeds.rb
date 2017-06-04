# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email
@rol = Role.create!(:name => "Administrador", :description => "Administrador")
@permission = Permission.create!(:subject_class => "all", :action => ["manage"])
@rol.permissions << @permission
@superuser = User.new first_name: 'Super', last_name: 'Admin', email: 'admin@admin.com', password: '12341234'
@superuser.role = @rol
@superuser.save!

# Datos por defecto para la empresa
if CompanyConfig.first.nil?
  @company_config = CompanyConfig.new name: 'ON', address: 'Encarnación', tel_fax: '(000) 000 000', celphone: '(0000) 000 000', email: 'email@email.com', avatar: '',current_pay:75558, letterhead: '10010010', validity_of_letterhead: Time.now
  @company_config.save!
end

# @admin = User.new(name: 'admin', email: 'admin@admin.com', password: "12341234")
# @admin.save

# Clientes
@alex = Client.new(name: "Alex", last_name: "Jines", ruc: 4159522, email: "abel.oalex@gmail.com", adress: "Calle Zoilo San Miguel C/ Gregorio Domanmchuk", phone:"0985833038")
@alex.save!
@jerson = Client.new(name: "Jerson", last_name: "Derulo", ruc: 3324597, email: "jersonDerulo@gmail.com", adress: "Calle independencia c/ J L Mallorquín", phone:"0985643749")
@jerson.save!


# Materiales
@cemento = Material.new(name: "Cemento", description: "Bolsas 50 kg", price: 50000, quantity: 10, minimun_stock: 1, measurement_unit: "Kg")
@cemento.save!
@cable = Material.new(name: "Cable", description: "50 mm", price: 10000, quantity: 10, minimun_stock: 1, measurement_unit: "m")
@cable.save!
@clavo = Material.new(name: "Clavo", description: "10 cm", price: 1000, quantity: 200, minimun_stock: 20, measurement_unit: "u")
@clavo.save!

# Proveedores
@provider = Provider.new(name: "Inpaco", address: "Avenida Irrazabal", phone: "205012", ruc: "1234456-1", email: "inpaco@test.com", state: TRUE, balance: 0)
@provider.save!
@provider2 = Provider.new(name: "Vallemi", address: "Villeta km 34", phone: "0985328593", ruc: "12945-1", email: "vallemi@test.com", state: TRUE, balance: 0)
@provider2.save!

# Jornaleros
@employee = Employee.new(name: "Jorge", last_name: "Esquivel", address: "San Juan del Parana", phone: "0985222333", identification_document: "4393032", email: "jorgenoob123@gmail.com")
@employee.save!
@employee = Employee.new(name: "Juan", last_name: "Ramíres", address: "San Pedro", phone: "098522453", identification_document: "5393032", email: "juam34@gmail.com")
@employee.save!

# Servicios
@service = Service.new(name: "Instalacion de cables", price: 1000000, description: "Se instalan los cables", measurement_unit: "m")
@service.save!

# Facturas de compra
@purchaseBill = PurchaseBill.new(number: 123, provider_id: @provider.id, date: '30/03/2017', condition: 'contado', total: 200000)
@purchaseBill.save!

# Facturas detalle
@purchaseDetail = PurchaseDetail.new(material_id: @clavo.id, quantity: 300, purchase_bill_id: @purchaseBill.id, price: 100)
@purchaseDetail.save!
@purchaseDetail = PurchaseDetail.new(material_id: @cable.id, quantity: 30, purchase_bill_id: @purchaseBill.id, price: 6000)
@purchaseDetail.save!
@purchaseDetail = PurchaseDetail.new(material_id: @cemento.id, quantity: 8, purchase_bill_id: @purchaseBill.id, price: 25000, total: 200000)
@purchaseDetail.save!
