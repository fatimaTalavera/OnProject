class BudgetPdf < Prawn::Document
  def initialize(budget,view)
    super(top_margin: 70)
@budget = budget
    @view = view
    title
    datos
    rubros
    total_amount


    repeat :all do
      #header

      config = CompanyConfig.first
      require 'open-uri'
      #imagen = image open ("#{config.avatar}")
      #image imagen, height: 50, width: 100, at: [bounds.left, bounds.top+50]
      bounding_box([bounds.left+130, bounds.top+40], :width => 200, :height => 200) do
        text "#{config.name}", :size => 20, :style => :italic
        text "Direccion: #{config.address}", :size => 10, :style => :italic
        text "Telefono: #{config.tel_fax}", :size => 10, :style => :italic
      end
      bounding_box([bounds.left+320, bounds.top+18], :width => 200, :height => 200) do
        text "Celular: #{config.celphone}", :size => 10, :style => :italic
        text "Email: #{config.email}", :size => 10, :style => :italic
      end

      stroke do
        horizontal_line 0, 500, :at => 620
        horizontal_line 0, 500, :at => 15
      end

      #footer
      number_pages "Pag. <page> de <total>", at: [200,-5]
      number_pages "Impreso el #{Time.now}", at: [bounds.right-200,0], width: 200, align: :right
    end
  end

  def title
    move_down 35
    text "Presupuesto", :size => 18, :style => :italic, align: :center
  end

  def rubros
    move_down 30
    table rubros_rows do
      cells.padding = 10
      cells.borders = []
      row(0).borders = [:bottom]
      row(0).border_width = 1
      row(0).font_style = :bold

    #  row(0).font_style = :bold
      columns(0..3).align = :right
      columns(0..3).borders = [:right]

      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
   #   row(0).columns(0..5).borders = [:bottom, :right]
    end
  end

  def rubros_rows
    [["Rubro","Cantidad" , "Unid. Medida", "Precio Unitario", "Subtotal"]] +
        @budget.budget_details.map do |detail|
          [detail.rubro_name, detail.quantity, detail.rubro_measurement_unit, price(detail.price), price(detail.subtotal)]
        end
  end

  def total_amount
    move_down 15
    text "Monto Total: #{price(@budget.total_amount)}", size: 12, style: :bold
  end

  def datos
    move_down(20)
    text "Cliente: #{@budget.client_name}", size: 12, style: :bold
    text "Obra: - ", size: 12, style: :bold
  end

 private
  def price(n)
    @view.number_to_currency_py(n)
  end
  end

