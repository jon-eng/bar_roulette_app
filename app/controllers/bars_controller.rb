class BarsController < ApplicationController
  def search
    bar_results = Bar.find_bar(params[:near][:distance][:bar_price])
    render json: bar_results
  end
end
