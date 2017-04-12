json.results do

	json.array!(@products) do |p|
    json.created_at p.created_at
    json.name p.name
  end


end