Dir['./app/**/*.rb'].each {|file| require file }

run RentController