class HomeController < ApplicationController
    include Pagy::Backend

    def index
      @q = BlogPost.ransack(params[:q])
      if params[:q].present? && params[:q][:title_cont].present?
        @pagy, @blog_posts = pagy(@q.result.order(created_at: :desc))
      else
        @pagy, @blog_posts = pagy(BlogPost.order(created_at: :desc))
      end
    rescue Pagy::OverflowError
      redirect_to root_path(page: 1)
    end
end
