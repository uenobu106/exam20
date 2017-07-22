class User < ActiveRecord::Base
  # has_many 子モデル（topics）が複数紐づくアソシエーションを定義
    has_many :topics

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end
