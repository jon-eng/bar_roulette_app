class Bar
  
  BASE_URL = "https://api.foursquare.com/v2/venues/explore"

  CLIENT_ID = "BNAPSUX5Q2VGUM2JOAQGHXHGCK5WGGHWQPF2VWKZJG5XLKUL"

  CLIENT_SECRET = "F4OSS11HXEOPZP41WPYYXDSV2NHR2BYZGZWNX44OJ3PEBLZ0"

  V = "20150401"


  def self.find_bar()
    bar_data = HTTParty.get("https://api.foursquare.com/v2/venues/explore", :query =>{:near => "520 12th St New York, NY", :client_id => "BNAPSUX5Q2VGUM2JOAQGHXHGCK5WGGHWQPF2VWKZJG5XLKUL", :client_secret => "F4OSS11HXEOPZP41WPYYXDSV2NHR2BYZGZWNX44OJ3PEBLZ0", :v => "20150401", :section => "drinks", :limit => "200", :radius => "15000", :price => "2"})

    random_bar = bar_data["response"]["groups"][0]["items"].sample

    # price = random_bar["venue"]["price"]["tier"]
    # lat = random_bar["venue"]["location"]["lat"]
    # lng = random_bar["venue"]["location"]["lng"]

    random_bar
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
