class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    l = List.new(list_params)
    if l.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find([params[:id]])[0]
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
