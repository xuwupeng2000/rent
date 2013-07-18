require 'bundler/setup'
require 'sinatra'

class ApplicationController < Sinatra::Base

  set :views, 'app/views'

end