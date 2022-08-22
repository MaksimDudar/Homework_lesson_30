#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "homework.db"}

class Post < ActiveRecord::Base
end


get '/' do
	@posts = Post.order('created_at DESC')
	erb :index
end

get '/new' do
	@p = Post.new
  erb :new
end

post '/new' do
	@p = Post.new params[:post]
	if @p.save
		redirect to '/'

	else
		@error = @p.errors.full_messages.first
		erb :new
	end
	end
