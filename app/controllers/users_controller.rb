class UsersController < ApplicationController
  
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

    def login
    end
    def register
        user=User.find_by_name(params[:name])
        if user&&user.authenticate(params[:name],params[:password])
            session[:current_user_id]=user.id
             redirect_to :root 
         else 
             render 'new'
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
