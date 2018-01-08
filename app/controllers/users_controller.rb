class UsersController < ApplicationController
#   skip_before_action :require_login, only: [:new.:create,:register,:logout]
USERS={ '123456'=> '123456'}
before_action :authenticate
    def new
        @user=User.new
    end
  def create
    @user=User.new(params_user) 
    
    if @user.save    
    cookies[:current_user_id]=@user.id
    puts "注册成功"
    redirect_to :root
    
    else
    puts '@user.id:'
    puts @user.id
    # binding.pry
    @user.errors
    redirect_to new_user_url
    end
  
  end

    def login  
        
        user=User.find_by(name: params[:name])
        # binding.pry
        if user && user.authenticate(params[:password])
            cookies[:current_user_id]=user.id
            flash[:notice]="登录成功"
            puts '登陆成功'
          
             redirect_to :root 
         else 
            flash.now[:notice]='登录失败'
            puts '登陆失败'
             render 'login'
         end
    end
    def logout
        @_current_user=cookies[:current_user_id]=nil
        redirect_to :root
    end
    def delete_user
        id=current_user.id
        @user=User.find_by(id: id)
        # binding.pry
        @user.destroy
        redirect_to :root
      end
    private

    def params_user
        params.require(:user).permit!
    end
    def authenticate
        authenticate_or_request_with_http_digest do |username|
            USERS[username]
        end
    end
end
