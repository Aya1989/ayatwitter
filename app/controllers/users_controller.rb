class UsersController < ApplicationController
        

    def edit #ユーザー詳細編集ページ
        @user = User.find(params[:id])
    end

    def show #ユーザー詳細ページ
        
            @loguser = current_user
    end

    def update
        # アップデートがうまくいけば、マイページに戻利、
        # うまくいかなければ、もう一度編集ページを表示する
        if current_user.update(user_params)
          redirect_to user_path(current_user)
        else
          redirect_to edit_user_path(current_user)
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name,:profile)
    end
    
    
end
