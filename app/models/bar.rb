class Bar < ActiveRecord::Base
  
  BASE_URL = "https://api.foursquare.com/v2/venues/explore"

  CLIENT_ID = "BNAPSUX5Q2VGUM2JOAQGHXHGCK5WGGHWQPF2VWKZJG5XLKUL"

  CLIENT_SECRET = "F4OSS11HXEOPZP41WPYYXDSV2NHR2BYZGZWNX44OJ3PEBLZ0"

  V = "20150401"


  def self.find_bar(query)
    bar_data = HTTParty.get(URI.escape([BASE_URL, "?near=", query[0], '&client_id=', CLIENT_ID, '&client_secret=', CLIENT_SECRET, '&v=', V, '&section=drinks&limit=200&radius=', query[1], '&price=', query[2], '&venuePhotos=1'].join('')))

    start_lat = bar_data["response"]["geocode"]["center"]["lat"]
    start_lng = bar_data["response"]["geocode"]["center"]["lng"]


    random_bar = bar_data["response"]["groups"][0]["items"].sample

    bar_object = {
      name:random_bar["venue"]["name"],
      rating:random_bar["venue"]["rating"],
      price:random_bar["venue"]["price"]["message"],
      street:random_bar["venue"]["location"]["address"],
      cross_street:random_bar["venue"]["location"]["crossStreet"],
      city:random_bar["venue"]["location"]["city"],
      state:random_bar["venue"]["location"]["state"],
      image:random_bar["venue"]["photos"]["groups"][0]["items"][0]["suffix"],
      start_lat:start_lat,
      start_lng:start_lng,
      end_lat:random_bar["venue"]["location"]["lat"],
      end_lng:random_bar["venue"]["location"]["lng"]
    }




    # price = random_bar["venue"]["price"]["tier"]
    # lat = random_bar["venue"]["location"]["lat"]
    # lng = random_bar["venue"]["location"]["lng"]

    # response = price + lat + lng

    # response
  end


end







# app.get("/search_for_bars", function (req, res) {
#   var llToSearch = req.query['ll'];
#   request({
#     uri: "https://api.foursquare.com/v2/venues/explore",
#     method: "GET",
#     json: true,
#      qs: { 
#       //ll: "40.7,-74",
#       ll: llToSearch,
#       section: "drinks",
#       client_id:"BNAPSUX5Q2VGUM2JOAQGHXHGCK5WGGHWQPF2VWKZJG5XLKUL",
#       client_secret:"F4OSS11HXEOPZP41WPYYXDSV2NHR2BYZGZWNX44OJ3PEBLZ0",
#       v: "20150401"
#     }
#   }, function(error, response, body) {
#     var arrayOfBars = [];
#    for (var i =0; i < 10; i++) {
#     var currentVenue = body.response.groups[0].items[i];
#     arrayOfBars.push(currentVenue)
    
#    } 
