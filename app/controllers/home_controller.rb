class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @products_most_reviews = Product.most_reviews
    @products_most_recent = Product.three_most_recent
    @products_locally_made = Product.locally_made
    render :index
  end
end