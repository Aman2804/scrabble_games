class UsersController < InheritedResources::Base

  def index
    @users = User.all  
  end

  def show
    @user = User.find(params[:id])
  end


  private

    def user_params
      params.require(:user).permit(:name, :contact)
    end

end
