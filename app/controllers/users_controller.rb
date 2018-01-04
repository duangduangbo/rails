class UsersController < ApplicationController
#   skip_before_action :require_login, only: [:new.:create,:register,:logout]
    def new
        @user=User.new
    end
  def create
    @user=User.new(params_user) 
     @user.save   
     session[:current_user_id]=@user.id
    flash[:notice]="注册成功"
    redirect_to :root
  end

    def register
        
        user=User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:current_user_id]=user.id
             redirect_to :root 
         else 
             render 'login'
         end
    end
    def logout
        @_current_user=session[:current_user_id]=nil
        redirect_to :root
    end
    private

    def params_user
        params.require(:user).permit(:name,:password,:email)
    end
end
