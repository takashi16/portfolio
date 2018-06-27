class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    @q = Blog.search(params[:q])
    @blogs = @q.result(distinct: true)
    @blogs = Blog.where("created_at not ?",nil)
    #@blog = Blog.order("@blog.impressionable_count ASC")
    @blogs =Blog.order("created_at DESC")
    @ranks = Blog.order('counter DESC').limit(10)
    #@most_viewed = @blog.order('impressionist_count ASC')
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
    @page_views = @blog.impressionist_count
    impressionist(@blog, nil, :unique => [:session_hash])
    @blog.increment!(:counter)
  end

  def new
    @blog = Blog.new
    @blog.tag_list.add('awesome' "slick")     # タグを追加
    @blog.tag_list.remove('awesome' "slick")  # タグを削除
  end

  def edit
    @blog = Blog.find(params[:id])
    @blog.tag_list.add('awesome' "slick")     # タグを追加
    @blog.tag_list.remove('awesome' "slick")  # タグを削除
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = current_user.id
    blog.save
    redirect_to blogs_path
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog.id)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

impressionist actions: [:index, :show]



private
      def blog_params
        params.require(:blog).permit(:title , :body, :image, :tag_list)
      end

end
