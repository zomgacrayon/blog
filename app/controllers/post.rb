get '/' do
  @posts = Post.all
  erb :index
end

get "/posts/create" do
 @title = "Create post"
 # @post = Post.create (params[:id])
 erb :create
end

post "/posts" do
  puts "======= DEBUG  =========="
   par = params[:post]
  p par

 @post = Post.new(body: par[:body], title: par[:title])
 @tag = Tag.new(tag_name: par[:tag_name])
 if @post.save
   redirect "posts/#{@post.id}"
 else
   erb :"create"
 end
end

get "/posts/:id" do
 @post = Post.find(params[:id])
 # @tag = Tag.find(params[:tag_name])
 @title = @post.title
 erb :"view"
end

get "/posts/:id/edit" do
@post = Post.find(params[:id])
erb :editpost
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  # insertfind or create by method
  @post.save

  redirect to("/posts/#{@post.id}")
end

# List posts
get '/posts' do
  @posts = Post.all
  erb :showpost
end

delete '/posts/:id' do
  @post = Post.find(params[:id]).destroy
  redirect to("/")
end