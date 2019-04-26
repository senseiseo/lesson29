#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barber.db"

class Client < ActiveRecord::Base

end	

class Barber < ActiveRecord::Base

end

get '/' do
	@barbers = Barber.all
	erb :index
end

get '/visit' do   
	erb :visit

end
post '/visit' do  
	@username = params[:username]
	@phone = params[:phone]
	@datestump = params[:datestump]
	@barber = params[:barber]
end