class ContractPdf < Prawn::Document
  def initialize(contract, view)
    super(top_margin: 70)
    @contract = contract
    @view = view
    title
    obra

    repeat :all do
      #header

      config = CompanyConfig.first
      require 'open-uri'
      #imagen = image open ("#{config.avatar}")
      #image imagen, height: 50, width: 100, at: [bounds.left, bounds.top+50]
      bounding_box([bounds.left+130, bounds.top+40], :width => 200, :height => 200) do
        text "#{config.name}", :size => 20, :style => :italic
        text "Dirección: #{config.address}", :size => 10, :style => :italic
        text "Teléfono: #{config.tel_fax}", :size => 10, :style => :italic
      end
      bounding_box([bounds.left+320, bounds.top+18], :width => 200, :height => 200) do
        text "Celular: #{config.celphone}", :size => 10, :style => :italic
        text "Correo electrónico: #{config.email}", :size => 10, :style => :italic
      end

      stroke do
        horizontal_line 0, 550, :at => 630
        horizontal_line 0, 550, :at => 15
      end

      #footer
      number_pages "Pag. <page> de <total>", at: [200,-5]
      number_pages "Impreso el #{Time.now}", at: [bounds.right-200,0], width: 200, align: :right
    end
  end

  def title
    move_down 35
    text "Contrato", :size => 18, :style => :italic, align: :center
  end

  def obra
    move_down(20)
    text "Obra:  #{@contract.name}", size: 12
    text "Descripción:  #{@contract.budget_description}", size: 12
    text "Monto: #{price(@contract.amount)}", size: 12
    text "Fecha Inicio:  #{@contract.start_date}", size: 12
    text "Fecha Fin:  #{@contract.end_date}", size: 12
  end

  private
  def price(n)
    @view.number_to_currency_py(n)
  end
end