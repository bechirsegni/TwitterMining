
def save(path, data)
  path =  path.split("/")[2].split(".").first.to_s
  fJson = File.open("./Data/#{path}.json","w")
  fJson.write(data.to_json)
  fJson.close
  @path = "./Data/#{path}.json"
end
