#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "homework.db"}

class Post < ActiveRecord::Base
end


get '/' do
	erb "Start"
end

get '/new' do
	@p = Post.new
  erb "post"
end

post '/new' do
	@p = Post.new params[:post]
	if @p.save
	  erb "<h2>Спасибо, пост добавлен!</h2>"
	else
		@error = @p.errors.full_messages.first
		erb "post"
	end
	end
