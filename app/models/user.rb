class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 下記追加（_idは含めない）
  attachment :profile_image
  
  has_many :results, dependent: :destroy
  # ユーザー名を空白で更新できないように追加
  validates :username, presence: true
end
