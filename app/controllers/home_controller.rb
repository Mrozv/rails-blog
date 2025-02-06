class HomeController < ApplicationController
    include Pagy::Backend

    def index
        @pagy, @blog_posts = pagy(BlogPost.order(created_at: :desc))
    rescue Pagy::OverflowError
        redirect_to root_path(page: 1)
    end
end
