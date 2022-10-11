class FavoritesController < ApplicationController
    
def create
   post_image = PostImage.find(params[:post_image_id])#いいねするブックをモデルからとってくる
    favorite = current_user.favorites.new(post_image_id: post_image.id)#誰からのいいねなのか、いいねのデータはどの投稿にたいしてのものなのかを定義してfavoriteに代入している　
    favorite.save#いいねを保存
    redirect_to post_image_path(post_image)#リダイレクトして画面遷移
end

def destroy
     post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
end

end
