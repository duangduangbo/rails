class UsersController < ApplicationController
  
    def new
        
    end
  def create
    @user=User.new(params_user)
    if @user.save
        redirect_to root_url
    else render 'register'
    end
  end
  
    def login
    end
    def register
        @user=User.new
    end

    private

    def params_user
        params.require(:user).permit(:name,:password,:email)
    end
end
