require 'geocoder'

def geocode(path)
  data = JSON.parse( IO.read(path, encoding:'utf-8') )
  geocoded = []
  data.each do |d|
    unless Geocoder.search(d["location"]).first.nil?
      geocoded << d.merge(lat: Geocoder.search(d["location"]).first.coordinates.first ,
      lng: Geocoder.search(d["location"]).first.coordinates.last )
    end
  end
  save(path, geocoded)
end
