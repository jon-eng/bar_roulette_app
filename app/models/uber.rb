class Uber
  BASE_URL = "https://api.uber.com/v1/estimates/price?start_latitude=37.7759792&start_longitude=-122.41823&end_latitude=40.7127837&end_longitude=-74.00594130000002"

  SERVER_TOKEN = "sjUndGBeIguBtQ0uDl1Z_rJlCqhZEgQ5indoUN0Q"

  def self.find_uber
    uber_data = HTTParty.get("https://api.uber.com/v1/estimates/price?start_latitude=40.716153&start_longitude=-73.984321
&end_latitude=40.7127837&end_longitude=-74.00594130000002", headers: {"Authorization" => "Token sjUndGBeIguBtQ0uDl1Z_rJlCqhZEgQ5indoUN0Q"})
  end

end