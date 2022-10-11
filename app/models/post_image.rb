class PostImage < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :post_comments , dependent: :destroy
    has_many :favorites , dependent: :destroy
    
    def favorited_by?(user) #ユーザーにいいねされているか？
       favorites.exists?(user_id: user.id)#favoritesテーブルに引数で渡されたユーザーはいるか確認の処理をお願いしている(user_id :user.id)はユーザーidをカラムに代入しているという記述
    end
    
    validates :shop_name, presence: true
    validates :image, presence: true
    def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
    end
end

#get_imageメソッドの内容は、画像が設定されない場合はapp/assets/imagesに格納されている
#no_image.jpgという画像をデフォルト画像としてActiveStorageに格納し、格納した画像を表示してという意味