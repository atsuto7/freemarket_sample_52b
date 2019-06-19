module ProductsHelper

  def product_status(status)
    case status
      when 1
        "新品、未使用品"
      when 2
        "未使用に近い"
      when 3
        "目立った傷や汚れなし"
      when 4
        "やや傷や汚れあり"
      when 5
        "傷や汚れがあり"
      when 6
        "全体的に状態が悪い"
    end
  end

  def obligation_fee(fee)
    case fee
      when 1
        "送料込み(出品者負担)"
      when 2
        "着払い(購入者負担)"
    end
  end

  def shipment_method(method)
    case method
    when 1
      "未定"
    when 2
      "らくらくメルカリ便"
    when 3
      "ゆうメール"
    when 4
      "レターパック"
    when 5
      "普通郵便(定型、定型外)"
    when 6
      "クロネコヤマト"
    when 7
      "ゆうパック"
    when 8
      "クリックポスト"
    when 9
      "ゆうパケット"
    end
  end

  def deliverytime(time)
    case time
      when 1
        "1~2日で発送"
      when 2
        "2~3日で発送"
      when 3
        "4~7日で発送"
    end
  end

end
