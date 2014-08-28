require 'sinatra'
require './finsec.rb'

get '/', provides: :html do
  @data = FinYah.new('goog').get
  haml :index
end
