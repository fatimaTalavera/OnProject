class ReportsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.reports.index'), :budgets_path

  def index

  end

  def materials

    if material_params[:contract_id].blank?
      contrato = nil
    else
      contrato = Contract.find(material_params[:contract_id])
    end
    material = Material.find(material_params[:material_id])
    inicio = Date.parse(material_params[:start_date]) rescue inicio = nil
    fin = Date.parse(material_params[:end_date]) rescue fin = nil

    p inicio.to_s + fin.to_s
    p "year" + inicio.year.to_s
    pdf = MaterialPdf.new(contrato, material, inicio, fin, view_context)
    send_data pdf.render,
              filename: "materiales.pdf",
              type: 'application/pdf',
              disposition: 'inline'
  end

  def bills
    if bills_params[:contract_id].blank?
      contrato = nil
    else
      contrato = Contract.find(bills_params[:contract_id])
    end
    inicio = Date.parse(bills_params[:start_date]) rescue inicio = nil
    fin = Date.parse(bills_params[:end_date]) rescue fin = nil

    pdf = SaleBillsPdf.new(contrato, inicio, fin, view_context)
    send_data pdf.render,
              filename: "facturación.pdf",
              type: 'application/pdf',
              disposition: 'inline'
  end

  def employees
    if employees_params[:contract_id].blank?
      contrato = nil
    else
      contrato = Contract.find(employees_params[:contract_id])
    end
    if employees_params[:employee_id].blank?
      employee = nil
    else
      employee = Employee.find(employees_params[:employee_id])
    end
    inicio = Date.parse(employees_params[:start_date]) rescue inicio = nil
    fin = Date.parse(employees_params[:end_date]) rescue fin = nil

    pdf = EmployeePdf.new(contrato, employee, inicio, fin, view_context)
    send_data pdf.render,
              filename: "facturación.pdf",
              type: 'application/pdf',
              disposition: 'inline'
  end

  private

  def material_params
    params.permit(:material_id, :contract_id, :start_date, :end_date, :commit, :utf8)
  end

  def bills_params
    params.permit(:contract_id, :start_date, :end_date, :commit, :utf8)
  end

  def employees_params
    params.permit(:contract_id, :employee_id, :start_date, :end_date, :commit, :utf8)
  end
end