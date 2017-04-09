class Models
  include Ruby::Enum
  define :Role, "Roles"
  define :User, "Usuarios"
  define :Client, "Clientes"
  define :Employee, "Empleados"
  define :InternalCertification, "Certificación Interna"
  define :ClientCertification, "Certificación Externa"
  define :Contract, "Contratos"
  define :Material, "Materiales"
  define :MaterialMovement, "Mov. de materiales"
  define :Provider, "Proveedores"
  define :Service, "Servicios"
  define :PurchaseBill, "Factura de compras"
  define :CompanyConfig, "Datos de la empresa"
end
