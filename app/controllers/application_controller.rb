class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
   bakeries = Bakery.all
   bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end
  get '/baked_goods/by_price' do
    bakedgoods = BakedGood.order(price: :desc)
    bakedgoods.to_json
  end
  get '/baked_goods' do
    allbaked = BakedGood.all
    allbaked.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expe = BakedGood.all.order(price: :desc).limit(1).first
    most_expe.to_json
  end




end
