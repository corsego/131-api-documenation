user = User.first
api_token = user.api_tokens.create!
MySecretApiToken = api_token.token

```sh
# check connection
curl -X GET localhost:3000/api/v1/home/index.json -H "Authorization: Bearer MySecretApiToken"

# posts#index
curl -X GET localhost:3000/api/v1/posts.json -H "Authorization: Bearer MySecretApiToken"

# posts#show 
curl -X GET localhost:3000/api/v1/posts/1.json -H "Authorization: Bearer MySecretApiToken"

# posts#create
curl -X POST -H "Content-Type: application/json" -d '{"post": {"title": "via api"}}' localhost:3000/api/v1/posts.json -H "Authorization: Bearer MySecretApiToken"

# posts#destroy
curl -X DELETE localhost:3000/api/v1/posts/3.json -H "Authorization: Bearer MySecretApiToken"

# posts#update
curl -X PATCH -H "Content-Type: application/json" -d '{"post": {"title": "via api edited 2"}}' localhost:3000/api/v1/posts/4.json -H "Authorization: Bearer MySecretApiToken"
```
