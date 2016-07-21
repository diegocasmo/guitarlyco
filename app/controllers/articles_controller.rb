class ArticlesController < ApplicationController

  # GET /articles
  def index
    page = params[:page]
    per_page = params[:per_page]
    @articles = Article.get_paginated(page, per_page)
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end
end
