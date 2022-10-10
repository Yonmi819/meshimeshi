class PostCommentsController < ApplicationController
    
 def create
   post_image = PostImage.find(params[:post_image_id]) #投稿するブックのデータを一件取得してきて
   comment = current_user.post_comments.new(post_comment_params) #ユーザーがコメントしたデータをコメントモデルに紐づくデータとして保存する準備をしている
   comment.post_image_id = post_image.id #コメントした本がどんなものなのかを明確にさせたい コメントしたブックのidは最初にデータをとってきた本だよ
   comment.save  #コメントを保存する
   redirect_to post_image_path(post_image) #保存できたらブックの詳細ページにとんでね
 end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

private 

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end

 
 
