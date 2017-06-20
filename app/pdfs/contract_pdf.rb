class ContractPdf < Prawn::Document
  def initialize(contract, view)
    super(top_margin: 70)
    @contract = contract
    @view = view
    title
    work
    client
    rubros
    expected_gain
    total_gain

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

  def work
    font_size(12) do
      text_box "Obra: #{@contract.name}", :kerning => true, :at => [0, y - 40]
      text_box "Estado: #{@contract.state}", :kerning => true, :at => [300, y - 40]
      text_box "Descripción: #{@contract.budget_description}", :kerning => false, :at => [0, y - 60]
      text_box "Fecha Inicio: #{@contract.start_date}", :kerning => true, :at => [0, y - 100]
      text_box "Fecha Fin: #{@contract.end_date}", :kerning => false, :at => [300, y - 100]
      text_box "Monto: #{price(@contract.amount)}", :kerning => false, :at => [0, y - 120]
      stroke do
        horizontal_line 0, 550, :at => y - 145
      end
    end
  end

  def client

    font_size(12) do
      text_box "Cliente: #{@contract.budget.client_name}", :kerning => true, :at => [0, y - 160]
      text_box "RUC: #{@contract.budget.client.ruc}", :kerning => true, :at => [0, y - 180]
      text_box "Email: #{@contract.budget.client.email}", :kerning => true, :at => [250, y - 180]
      text_box "Dirección: #{@contract.budget.client.adress}", :kerning => true, :at => [0, y - 200]
      text_box "Teléfono: #{@contract.budget.client.phone}", :kerning => true, :at => [0, y - 220]
    end
    stroke do
      horizontal_line 0, 550, :at => y - 240
    end
  end

  def rubros
    move_down 220
    text "Rubros", :size => 12, :style => :bold
    table budget_rows do
      cells.padding = 6
      cells.borders = []
      row(0).borders = [:bottom]
      row(0).border_width = 1
      row(0).font_style = :bold

      #  row(0).font_style = :bold
      columns(0..4).align = :right
      columns(0..4).borders = [:right]

      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
      row(0).columns(0..6).borders = [:bottom, :left]
      columns(0).width = 120
      columns(1).width = 65
      columns(2).width = 75
      columns(3).width = 65
      columns(4).width = 100
      columns(5).width = 100
    end
  end

  def budget_rows
    [["Rubro","Cantidad", "Certificado", "Ud. Medida", "Precio Unitario", "Subtotal"]] +
        @contract.budget.budget_details.map do |detail|
          [detail.rubro_name, eval(sprintf("%3.2f",detail.quantity)), eval(sprintf("%3.2f",detail.certified_quantity)), detail.measurement_unit, price(detail.price), price(detail.subtotal)]
        end
  end

  def expected_gain
    move_down 30
    text "Ganancia esperada", :size => 12, :style => :bold
    table expected_gain_rows do
      cells.padding = 6
      cells.borders = []
      row(0).borders = [:bottom]
      row(0).border_width = 1
      row(0).font_style = :bold

      #  row(0).font_style = :bold
      columns(0..4).align = :right
      columns(0..4).borders = [:right]

      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
      row(0).columns(0..2).borders = [:bottom, :left]
      columns(0).width = 120
      columns(1).width = 65
    end
  end

  def expected_gain_rows
    [["Rubro", "Utilidad"]] +
        @contract.budget.budget_details.map do |detail|
          [detail.rubro_name, detail.utility]
        end
  end

  def total_gain
    move_down 15
    text "Ganancia aproximada: #{price(@contract.budget.expected_gain)}", size: 12, style: :bold
  end

  private
  def price(n)
    @view.number_to_currency_py(n)
  end
end