class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end
    
    def show
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = " Welcome to Blog , #{@user.username}"
            redirect_to articles_path
        else
            render "new"
        end
            
    end

    # GET /users/1/edit
    def edit
    end    

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        if @user.update(user_params(nil))
            flash[:success] = "User was successfully updated."
            redirect_to articles_path
        else
            flash[:danger] = "updation of user was failed"
            render :edit
        end 
    end          

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params(password = :password)
      params.require(:user).permit(:username, :email, password)
    end
end