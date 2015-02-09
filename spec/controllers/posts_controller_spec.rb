# encoding: utf-8

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "root posts#index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @posts" do
      post1 = Post.new(title: "Teste1", message: "Mensagem1")
      post1.save
      post2 = Post.new(title: "Teste2", message: "Mensagem2")
      post2.save

      get :index

      expect(assigns(:post)).to match_array [post1, post2]
    end
  end

  describe "GET posts#post" do
  	it "assigns the requested post to post1" do
  	  post1 = Post.new(title: "Teste1", message: "Mensagem1")
  	  post1.save

  	  get :post, post: post1

  	  expect(assigns(:post)).to eq post1
  	end

  	it "renders the :post template" do
  	  post1 = Post.new(title: "Teste1", message: "Mensagem1")
  	  post1.save

  	  get :post, post: post1

  	  expect(response).to render_template :post
  	end
  end
end
