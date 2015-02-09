# encoding: utf-8
require 'rails_helper'

RSpec.describe Post, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  it "should be invalid without a title" do
  	post = Post.new(title: nil, message: 'Teste')
  	post.valid?
  	expect(post.errors[:title]).to include("can't be blank")
  end

  it "should be invalid without a message" do
  	post = Post.new(title: 'Teste', message: nil)
  	post.valid?
  	expect(post.errors[:message]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
  	Post.create(
  		title: 'Titulo', message: 'mensagem',
  	)
  	post = Post.new(
  		title: 'Titulo', message: 'Mensagem diferente'
  	)
  	post.valid?
  	expect(post.errors[:title]).to include("has already been taken")
  end

  it "should be invalid without a title and message" do
  	post = Post.new(title: nil, message: nil)
  	post.valid?
  	expect(post.errors[:message]).to include("can't be blank")
  end

  it "returns a slug correct name for a post title" do
  	post = Post.new(title: 'Titulo sem acentos', message: 'Mensagem padrao')
  	post.save
  	expect(post.slug).to eq 'titulo-sem-acentos'
  end

  it "returns a slug correct name for a post title with acentos" do
  	post = Post.new(title: 'Título com acentos', message: 'Mensagem padrão')
  	post.save
  	expect(post.slug).to eq 'titulo-com-acentos'
  end

end
