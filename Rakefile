require "./app/controllers/application_controller"
require "sinatra/activerecord/rake"

namespace :db do
  task :process_dataset do
    RentRecord.process_dataset
  end
end
