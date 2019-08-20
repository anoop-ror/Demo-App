class User1sController < InheritedResources::Base

  private

    def user1_params
      params.require(:user1).permit(:name, :email, :login)
    end

end
