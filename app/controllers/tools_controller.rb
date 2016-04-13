class ToolsController < ApplicationController

  def index
    if current_user
      # @user = User.find(session[:user_id])
      # @tools = @user.tools
      @tools = current_user.tools
    else
      @tools = Tool.all
    end
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
    @tool = current_user.tools.new(tool_params)
    if @tool.save
      session[:most_recent_tool_id] = @tool.id
      flash[:notice] = "Tool successfully created"
      redirect_to tool_path(@tool.id)
    else
      flash[:error] = "Tool creation failed!"
      render :new
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
