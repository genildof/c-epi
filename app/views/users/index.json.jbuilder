json.array!(@users) do |user|
  json.extract! user, :name, :username, :password, :profile, :email, :cidade_id
  json.url user_url(user, format: :json)
end
