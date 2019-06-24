crumb :root do
  link "メルカリ", root_path
end

crumb :product do |product|
  link product.name
  parent :root
end