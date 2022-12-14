class UsersController < ApplicationController
    def index
        @users = User.where(activated: FILL_IN).paginate(page: params[:page])
      end
    def show
        @user = User.find(params[:id]) 
        redirect_to root_url and return unless FILL_IN
    end
        if @user.save
            @user.send_activation_email
            UserMailer.account_activation(@user).deliver_now
            flash[:info] = "Please check your email to activate your account."
            redirect_to root_url
        else
            render 'new'
        end
    end
end
