require 'bundler/setup'
require 'sinatra'
require 'active_support/all'
require 'pry' if development?
require "sinatra/reloader" if development?

require File.dirname(__FILE__) + '/../models/rent_record'

class ApplicationController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure :production, :development do
    enable :logging
  end

  set :views, 'app/views'

end
