class SearchController < ApplicationController
  def users
    users = User.search(params[:query])

    respond_to do |format|
      format.json { render json: users }
    end
  end

  def technologies
    technologies = Technology.search(params[:query])

    respond_to do |format|
      format.json { render json: technologies }
    end
  end

  def categories
    categories = Category.search(params[:query])

    respond_to do |format|
      format.json { render json: categories }
    end
  end
end
