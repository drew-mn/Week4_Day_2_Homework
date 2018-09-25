require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
# require_relative('./models/*')
require_relative('./models/pizza_order')
also_reload('./models/*')

# index route - all the pizzas
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# create pizza route - new pizza
get '/pizza-orders/new' do
  erb(:new)
end

# create - make a pizza order
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# edit pizza route - edits pizza order
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# update pizza route - updates pizza order
post '/pizza-orders/:id/update' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect '/pizza-orders'
end

# delete - deletes a pizza order
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect '/pizza-orders'
end

# show route - show one pizza
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# create - make a pizza order
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end
