user = User.first
api_token = user.api_tokens.create!
token = api_token.token

curl -X GET localhost:3000/api/v1/home/index.json -H "Authorization: Bearer b7b0cee0299d486ab104bcccd813940e"
