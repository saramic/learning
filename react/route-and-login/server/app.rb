require 'sinatra/base'
require 'sinatra/cross_origin'
require 'json'
require 'jwt'

# continue with https://auth0.com/blog/ruby-authentication-secure-rack-apps-with-jwt/
# simplify the cors to specific site as per https://medium.com/addval-labs/adding-cors-configuration-to-a-sinatra-app-1ed426e2c028
# follow along for bootstrap react setup https://medium.com/addval-labs/adding-cors-configuration-to-a-sinatra-app-1ed426e2c028
class App < Sinatra::Base
  set :bind, '0.0.0.0'

  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  get '/auth/login' do
    "Hello World"
  end

  post "/auth/login" do
    puts params['email']
    puts params['password']
    if params['email'] =~ /saramic/ && params['password'] == 'password'
      content_type :json
      { token: token(params['email']) }.to_json
    else
      halt 401
    end
  end

  def token(username)
    JWT.encode(payload(username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload username
    {
      exp: Time.now.to_i + 60 * 60,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      scopes: ['secret'],
      user: {
        username: username
      }
    }
  end

  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end
end
