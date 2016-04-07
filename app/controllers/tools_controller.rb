class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy
    redirect_to tools_path
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool.id)
    else
      render :new
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
