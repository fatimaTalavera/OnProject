module ApplicationHelper
  LONGITUD_TEXTO = 30 # longitud maxima del texto

  def number_to_currency_py(number)
    number_to_currency(number, :unit => "Gs", :separator => ",", :delimiter => ".", :precision => 0)
  end

end
