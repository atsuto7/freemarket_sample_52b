crumb :root do
  link "メルカリ", root_path
end

crumb :product do |product|
  link product.name
  parent :root
end

crumb :mypage do 
  link "マイページ", mypages_path 
  parent :root
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :profile do
  link "プロフィール"
  parent :mypage
end

crumb :cards do
  link "支払い方法"
  parent :mypage
end

crumb :search do |keyword|
  link keyword
  parent :root
end

crumb :categories do |all_category|
  all_category.each do |category|
    link "     #{category.name}     ", category_path(category.id)
  end
  parent :root
end
