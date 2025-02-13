class BlogPostsController < ApplicationController
    before_action :set_blog_post, only: [ :show, :edit, :update, :destroy ]
    before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
    before_action :authorized_user, only: [ :edit, :update, :destroy ]


    def show
        @blog_post = BlogPost.find(params[:id])
        @comments = @blog_post.comments.includes(:user)
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = current_user.blog_posts.build(blog_post_params)
        if @blog_post.save
            redirect_to @blog_post, notice: "Blog post was successfully created."
        else
            render :new, status: :unprocessable_entity, alert: "There was an error creating the blog post."
        end
    end

    def edit
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def update
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @blog_post.destroy
        redirect_to root_path
    end

    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end

    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
    end

    def authorized_user
        redirect_to root_path, notice: "Not authorized." unless @blog_post.user == current_user
    end
end
