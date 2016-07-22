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
