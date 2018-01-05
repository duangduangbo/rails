class UsersController < ApplicationController
#   skip_before_action :require_login, only: [:new.:create,:register,:logout]
USERS={ '123456'=> '123456'}
before_action :authenticate
    def new
        @user=User.new
    end
  def create
    @user=User.new(params_user) 
    cookies[:current_user_id]=@user.id
    if @user.save    
    flash[:notice]="注册成功"
    redirect_to :root
    
    else
    puts '@user.id:'
    puts @user.id
    redirect_to new_user_url
    end
  
  end

    def register  
        user=User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            cookies[:current_user_id]=user.id
            flash[:success]="登录成功"
            puts '登陆成功'
             redirect_to :root 
         else 
            flash.now[:alert]='登录失败'
            puts '登陆失败'
             render 'login'
         end
    end
    def logout
        @_current_user=cookies[:current_user_id]=nil
        redirect_to :root
    end
    private

    def params_user
        params.require(:user).permit(:name,:email)
    end
    def authenticate
        authenticate_or_request_with_http_digest do |username|
            USERS[username]
        end
    end
end
