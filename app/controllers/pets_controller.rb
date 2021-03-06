class PetsController < ApplicationController
require 'pry'
  get '/pets' do
    @owner = Owner.all
    erb :'/pets/index' 
  end

  get '/pets/new' do
    @owner = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
     @pet = Pet.create(params[:pet])
    if !params["owner"]["name"].empty?
    @pet.owner = Owner.create(name: params["owner"]["name"])
  end
  @pet.save
  redirect "/pets/#{@pet.id}"
  end
    
  get '/pets/:id/edit' do 
    @pet = Pet.find(params[:id])
    @owner = Owner.all
    erb :'/pets/edit'
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do 
   @pet = Pet.find(params[:id])
   @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
    @pet.owner = Owner.create(name: params["owner"]["name"])
    @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end
end