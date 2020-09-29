class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :likes, :author_name
  has_many :comments

  def author_name
    object.user.username
  end
end


