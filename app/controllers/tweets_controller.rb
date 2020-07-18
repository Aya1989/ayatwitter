class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index #一覧ページ

        if params[:search] == nil
            @tweets= Tweet.all.page(params[:page]).per(3)
        elsif params[:search] == ''
            @tweets= Tweet.all.page(params[:page]).per(3)
        else
            @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3) #部分検索
        end
    
    end

    def new #新規投稿ページ
        @tweet = Tweet.new
    end

    def create
        @tweet = Tweet.new(tweet_params)
        @tweet.user_id = current_user.id

        if @tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def detail #ツイート詳細ページ
        @tweet = Tweet.find(params[:id])
        @like = Like.new
        @comments = @tweet.comments
        @comment = @tweet.comments.build
    end

    def edit #ツイート内容編集ページ
        @tweet = Tweet.find(params[:id])
    end

    def update
        @tweet = Tweet.find(params[:id])
        
        if @tweet.update(tweet_params)
          redirect_to :action => "detail", :id => @tweet.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        Tweet.find(params[:id]).destroy
        redirect_to action: :index
    end

    #def mypage
        #@loguser = current_user
    #end

    private
    def tweet_params
        params.require(:tweet).permit(:body,:image)
    end
end
