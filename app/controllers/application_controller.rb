
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do

    erb :new
  end

  get '/posts/:id' do

    @post = Post.find(params[:id])
    #binding.pry

    erb :show
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:contact])
    #binding.pry

    erb :index
    redirect_to '/posts'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    #@post.update(name: params[:name], content: params[:contact])
    #binding.pry
    # redirect to("/posts/#{@post.id}")
    #binding.pry
    erb :edit
  end

  patch '/posts/:id' do

  end

end
