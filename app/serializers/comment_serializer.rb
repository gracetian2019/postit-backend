class CommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :content, :likes, :created_at, :user_id, :post_id

 def username
  object.user.username
 end

 def user_id
  object.user.id
 end
 def post_id
  object.post.id
 end
end
