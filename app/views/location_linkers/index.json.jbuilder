json.array!(@location_linkers) do |location_linker|
  json.extract! location_linker, :id, :location, :description
  json.url location_linker_url(location_linker, format: :json)
end
