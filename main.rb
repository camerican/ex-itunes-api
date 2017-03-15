# main.rb
# iTunes API example

require 'net/http'
require 'json'
require 'sinatra'

base_uri = 'https://itunes.apple.com/search'

# puts "Enter an artist"
# artist = gets.strip


# provide a form to search for an artist
get '/' do
  @artist = nil
  @results = nil
  erb :home
end

# output the results of the search
post '/' do
  @artist = params[:artist]

  response = Net::HTTP.get(URI("#{base_uri}?term=#{@artist}&entity=song"))

  results = JSON.parse( response )

  @results = results['results'].map do |song|
    {
      id: song['trackId'],
      name: song['trackName'],
      price: song['trackPrice'],
      picture: song['artworkUrl100']
    }
  end

  erb :home
end







