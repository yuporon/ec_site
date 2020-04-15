class Public::EndUsersController < ApplicationController
    before_action :authenticate_end_user!
    # before_action :correct_user, only: [:edit]

    def show
        @end_user = current_end_user
    end
    def edit
        @end_user =  current_end_user
        
    end
    def update
        @end_user = current_end_user
      if @end_user.update(end_user_params)
        flash[:notice] = "successfully"
            redirect_to  public_end_user_path(@end_user.id)
      else
        flash[:notice] = "error"
        render :edit
      end
    end
    def withdrow
      @end_user =  current_end_user
    end
r
    private

    def end_user_params
      params.require(:end_user).permit(:kana_name, :last_name ,:email)
    end

end
