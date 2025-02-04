require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  it "is valid with valid attributes" do
    blog_post = FactoryBot.create(:blog_post)
    puts blog_post.inspect
    expect(blog_post).to be_valid
  end

  it "is invalid without a title" do
    blog_post = FactoryBot.build(:blog_post, title: nil)
    puts blog_post.inspect
    expect(blog_post).not_to be_valid
    expect(blog_post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a body" do
    blog_post = FactoryBot.build(:blog_post, body: nil)
    puts blog_post.inspect
    expect(blog_post).not_to be_valid
    expect(blog_post.errors[:body]).to include("can't be blank")
  end
end
