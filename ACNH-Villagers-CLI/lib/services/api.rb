class NewHorizonsAPI
  BASE_URL = "https://acnhapi.com"

  def get_villagers
    villagers = HTTParty.get(BASE_URL + "/v1/villagers")

  # iterate through the hash of villagers in the response and build a Villager object (instance) with each hash
    villagers.each do |villager_id,info|
      Villager.new(info["name"]["name-USen"], info["species"], info["personality"])
    end
    # returns villagers response body
  end
end
