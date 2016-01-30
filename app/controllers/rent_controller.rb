class RentController < ApplicationController

  get '/' do
    @areas = RentRecord.areas

    erb :index, locals: { areas: @areas }
  end

  post '/' do
    @area    = params[:area]
    @results = RentRecord.list(@area)

    if @results.any?
      erb :show, locals: { results: @results, area: @area.humanize }
    else
      erb :no_result, locals: { area: @area.humanize }
    end
  end

end
