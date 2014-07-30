class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
    User.id = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  

end
