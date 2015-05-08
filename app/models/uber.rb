class Uber
  BASE_URL = "https://api.uber.com/v1/products?latitude=37.7759792&longitude=-122.41823"

  SERVER_TOKEN = "sjUndGBeIguBtQ0uDl1Z_rJlCqhZEgQ5indoUN0Q"

  uber_data = HTTParty.get("https://api.uber.com/v1/products?latitude=37.7759792&longitude=-122.41823", headers: {"Authorization" => "Token sjUndGBeIguBtQ0uDl1Z_rJlCqhZEgQ5indoUN0Q"})
end