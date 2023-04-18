json.extract! post, :id, :title, :body, :created_at, :updated_at
json.user_email post.user.email
json.url post_url(post, format: :json)
