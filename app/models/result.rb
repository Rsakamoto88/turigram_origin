class Result < ApplicationRecord
    belongs_to :user
    attachment :image
    
    # 空白の投稿（タイトル、内容、画像）を弾く
    with_options presence: true do
      validates :title
      validates :body
      validates :image
    end
end
