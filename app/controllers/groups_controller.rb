class GroupsController < ApplicationController
  before_action :require_login

  # GET /groups
  # GET /groups.json
  def index
    @groups = current_user.groups
  end

  # GET /groups/new
  def new
    @group = current_user.groups.new
  end

  def show
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      flash.now[:alert] = 'Something went wrong, please check your data and try again'
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:Name, :Icon)
    end
end
