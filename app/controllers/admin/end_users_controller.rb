class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @end_user = EndUser.with_deleted.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
