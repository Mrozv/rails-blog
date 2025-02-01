class HomeController < ApplicationController
    def index
        @blog_posts = BlogPost.all.sort {|a, b| b.created_at <=> a.created_at}
    end
end