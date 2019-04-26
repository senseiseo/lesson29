#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barber.db"

class Client < ActiveRecord::Base
	validates :name, presence: true 
	validates :phone, presence: true 
	validates :datestump, presence: true 
	validates :barber, presence: true 
end	

class Barber < ActiveRecord::Base

end

get '/' do
	@barbers = Barber.all
	erb :index
end

get '/visit' do   
	@c = Client.new
	erb :visit

end
post '/visit' do  
		@c = Client.new params[:client]
		if @c.save
			erb "<h2> Спасибо вы записались</h2>"
		else 
			@error = @c.errors.full_messages.first
			erb :visit
		end
end