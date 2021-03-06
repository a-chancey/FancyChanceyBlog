require 'will_paginate/array' 

class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  # GET /posts.atom
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10).published.order('id DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.published.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  

end