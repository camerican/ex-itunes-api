# main.rb
# iTunes API example

require 'net/http'
require 'json'

base_uri = 'https://itunes.apple.com/search'

puts "Enter an artist"
artist = gets.strip

response = Net::HTTP.get(URI("#{base_uri}?term=#{artist}&entity=song"))

results = JSON.parse( response )

$data = results['results'].map do |song|
  {
    id: song['trackId'],
    name: song['trackName'],
    price: song['trackPrice'],
    picture: song['artworkUrl100']
  }
end





