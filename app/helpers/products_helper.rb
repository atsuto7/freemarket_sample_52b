module ProductsHelper


  def jpy_comma(price)
    "¥#{price.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')}"
  end

end
