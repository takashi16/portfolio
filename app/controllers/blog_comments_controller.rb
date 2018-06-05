class BlogCommentsController < ApplicationController
def create
blog = Blog.find(params[:blog_id])
    comment = current_user.blog_comments.new(blog_comment_params)
    comment.blog_id = blog.id
    comment.save
    redirect_to blogs_path(blog)
end





private
def blog_comment_params
  params.require(:blog_comment).permit(:user_id,:blog_id,:comment)
end

end