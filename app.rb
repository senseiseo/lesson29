#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barber.db"

class Client < ActiveRecord::Base
	validates :name, presence: true , length: {minimum:3, maximum:33}
	validates :phone, presence: true 
	validates :datestump, presence: true 
	validates :barber, presence: true 
end	

class Barber < ActiveRecord::Base

end

get '/' do 
	erb :index
end

before do
	@barbers = Barber.all	
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

get '/barber/:id' do  
	@barber = Barber.find(params[:id])
	erb :barber
end  

get '/booking' do   
	@client = Client.order('created_at DESC')
	
	erb :client
end

get '/client/:id' do 
	@client = Client.find(params[:id])
	erb :client
end  
