class Publics::EndUsersController < ApplicationController
    before_action :authenticate_end_user!
    # before_action :correct_user, only: [:edit]

    def show
    end
    def edit
    end

end
