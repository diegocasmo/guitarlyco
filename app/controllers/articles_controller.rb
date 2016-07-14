class ArticlesController < ApplicationController

  # GET /articles
  def index
    page = params[:page]
    per_page = params[:per_page]
    @articles = Article.get_paginated(page, per_page)
  end

  # GET /articles/:article_slug
  def show
    @article = Article.find_by_slug(params[:article_slug])
    render template: 'articles/show', locals: { article: @article }
  end
end
