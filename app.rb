require 'sinatra'
require 'oauth2'
require 'json'
require "sinatra/base"
require "sinatra/reloader"

enable :sessions
CONSUMER_KEY = "PUT_YOURS_HERE"
CONSUMER_SECRET = "PUT_YOURS_HERE"
def client
  OAuth2::Client.new(CONSUMER_KEY, CONSUMER_SECRET, :site => "https://www.ribbon.co")
end

get "/" do
  if session[:access_token].nil? # || In a more mature version, we would test to see if the token is still valid.  If not, then authorize the user again.
    redirect '/authorize_user'
  else
    redirect '/show_products'
  end
end

get "/authorize_user" do
  redirect client.auth_code.authorize_url(:redirect_uri => redirect_uri, :scope => "non-expiring")
end

get '/auth/callback' do
  access_token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
  session[:access_token] = access_token.token
  # Make sure to save your token and associate it with the relevant user.
  # you can get multiple access tokens if you authenticate multiple times
  @message = "Successfully authenticated with the server"
  @header = "Congratulations"
  erb :display_response
end

get '/show_products' do
  @message = get_response('products.json')
  @products = @message['products']
  erb :show_products
end

get '/show_product/:product_url' do
  @message = get_response('products/'+params[:product_url]+'.json')
  @header = 'Product Show Page'
  erb :display_response
end

post '/create_product' do
  @message = post_response('products.json',params)
  redirect '/show_products'
end

def get_response(url)
  access_token = OAuth2::AccessToken.new(client, session[:access_token])
  JSON.parse(access_token.get("/api/v1/#{url}").body)
end

def post_response(url,params)
  access_token = OAuth2::AccessToken.new(client, session[:access_token])
  JSON.parse(access_token.post("api/v1/#{url}") do |request|
    request.params = params
  end.body)

end


def redirect_uri
  uri = URI.parse(request.url)
  uri.path = '/auth/callback'
  uri.query = nil
  uri.to_s
end
