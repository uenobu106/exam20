class Topic < ActiveRecord::Base
  validates :title,:content, presence: true
  belongs_to :user
  # CommentモデルのAssociationを設定
  has_many :comments, dependent: :destroy
end
