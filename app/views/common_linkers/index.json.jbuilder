json.array!(@common_linkers) do |common_linker|
  json.extract! common_linker, :id, :cliche, :description
  json.url common_linker_url(common_linker, format: :json)
end
