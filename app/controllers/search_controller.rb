class SearchController < ApplicationController
  
  def index
    @query = Cafe.ransack(params[:q])
    @cafes = @query.result(distinct: true)
  end
end
