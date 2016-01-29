require 'bundler/setup'
require 'sinatra'
require "sinatra/reloader"
require 'active_support/all'
require 'pry' if development?

class ApplicationController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure :production, :development do
    enable :logging
  end

  set :views, 'app/views'

end
