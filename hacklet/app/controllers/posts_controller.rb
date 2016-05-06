class PostsController < Blogit::PostsController
  def show
    super do |post|
      @next_post = Blogit::Post.where("id > ?", post.id).first
      @prev_post = Blogit::Post.where("id < ?", post.id).last
    end
  end
end
