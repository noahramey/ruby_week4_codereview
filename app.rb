require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

get('/brands/new') do
  erb(:brand_form)
end

get('/brands/:id') do
  @brand = Brand.find(params[:id])
  erb(:brand)
end

post('/brands') do
  name = params[:name]
  @brand = Brand.new({name: name})
  if @brand.save()
    redirect('/brands')
  else
    erb(:brand_error)
  end
end

# ####################### #
# ####################### #

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

get('/stores/new') do
  @brands = Brand.all()
  erb(:store_form)
end

post('/stores') do
  @brands = Brand.all()
  name = params[:name]
  @store = Store.new({name: name})
  if @store.save()
    @brands.each() do |brand|
      brand_id = params["#{brand.id()}"]
      if brand_id
        brand = Brand.find((brand_id).to_i())
        @store.brands.push(brand)
      end
    end
    redirect('/stores')
  else
    erb(:store_error)
  end
end

get('/stores/:id') do
  @store = Store.find(params[:id])
  erb(:store)
end

get('/stores/:id/edit') do
  @store = Store.find(params[:id])
  @brands = Brand.all()
  erb(:store_edit)
end

patch('/stores/:id') do
  @store = Store.find(params[:id])
  @brands = Brand.all()
  name = params[:name]
  @brands.each() do |brand|
    brand_id = params["#{brand.id()}"]
    if brand_id
      brand = Brand.find((brand_id).to_i())
      @store.brands.push(brand)
    end
  end
  @store.update({name: name})
  redirect("/stores/#{@store.id()}")
end

delete('/stores/:id') do
  @store = Store.find(params[:id])
  @store.destroy()
  redirect('/stores')
end
