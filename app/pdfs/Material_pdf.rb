class MaterialPdf < Prawn::Document
  def initialize(contract, material, start_date, end_date, view)
    super(top_margin: 70)
    @contract = contract
    @material = material
    @start_date = DateTime.new(start_date.year, start_date.month, start_date.day, 0, 0, 0)
    @end_date = DateTime.new(end_date.year, end_date.month, end_date.day, 23, 59, 59)
    @view = view
    title
    datos
    materials
    total_amount


    repeat :all do
      #header

      config = CompanyConfig.first
      require 'open-uri'
      #imagen = image open ("#{config.avatar}")
      #image imagen, height: 50, width: 100, at: [bounds.left, bounds.top+50]
      bounding_box([bounds.left+20, bounds.top+40], :width => 200, :height => 200) do
        text "#{config.name}", :size => 20, :style => :italic
        text "Dirección: #{config.address}", :size => 10, :style => :italic
        text "Teléfono: #{config.tel_fax}", :size => 10, :style => :italic
      end
      bounding_box([bounds.left+320, bounds.top+18], :width => 200, :height => 200) do
        text "Celular: #{config.celphone}", :size => 10, :style => :italic
        text "Correo electrónico: #{config.email}", :size => 10, :style => :italic
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

  def materials
    move_down 30
    if @contract.nil?
      table materials_rows do
        cells.padding = 6
        cells.borders = []
        row(0).borders = [:bottom]
        row(0).border_width = 1
        row(0).font_style = :bold

        #  row(0).font_style = :bold
        columns(0..5).align = :right
        columns(0..5).borders = [:right]

        self.row_colors = ['DDDDDD', 'FFFFFF']
        self.header = true
        row(0).columns(0..5).borders = [:bottom, :left]
        columns(1).width = 140
        columns(1).width = 110
        columns(2).width = 130
        columns(3).width = 145
        #Suma de ancho es 425
      end
    else
      table materials_rows do
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
        row(0).columns(0..3).borders = [:bottom, :left]
        columns(0).width = 190
        columns(1).width = 190
        columns(2).width = 145
        #Suma de ancho es 425
      end
    end
  end

  def materials_rows
    p @contract.nil?
    @total = 0
    @quantity = 0
    if @contract.nil?
      [["Contrato", "Cantidad" , "Precio Unitario", "Fecha"]] +
          MovementDetail.where(material_id: @material.id).where('movement_details.created_at BETWEEN ? AND ?', @start_date, @end_date).map do |detail|
            @total = @total + (detail.quantity * detail.price)
            @quantity = @quantity + detail.quantity
            [detail.material_movement.contract.name, eval(sprintf("%3.2f", detail.quantity)), price(detail.price), detail.material_movement.date]
          end
    else
      [["Cantidad" , "Precio Unitario", "Fecha"]] +
          @contract.movement_details.where(material_id: @material.id).where('movement_details.created_at BETWEEN ? AND ?', @start_date, @end_date).map do |detail|
            @total = @total + (detail.quantity * detail.price)
            @quantity = @quantity + detail.quantity
            [eval(sprintf("%3.2f", detail.quantity)), price(detail.price), detail.material_movement.date]
          end
    end
  end

  def title
    move_down 35
    text "Movimientos de Materiales", :size => 18, :style => :italic, align: :center
  end

  def datos
    move_down(20)
    text "Rango: " + @start_date.strftime("%d/%m/%Y") + " - " + @end_date.strftime("%d/%m/%Y"), size: 12, style: :bold
    text "Material: " + @material.name, size: 12, style: :bold
    if !@contract.nil?
      text "Obra: " + @contract.name, size: 12, style: :bold
    end
  end

  def total_amount
    move_down 15
    text "Cantidad Total: " + @quantity.to_s, size: 12, style: :bold
    text "Monto Total: " + price(@total), size: 12, style: :bold
  end

  private
  def price(n)
    @view.number_to_currency_py(n)
  end
end