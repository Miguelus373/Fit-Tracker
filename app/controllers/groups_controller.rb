class GroupsController < ApplicationController
  before_action :require_login

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all.includes(:user)
  end

  # GET /groups/new
  def new
    @group = current_user.groups.new
    @icons = [
      'https://www.flaticon.com/svg/static/icons/svg/926/926158.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926151.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926165.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926161.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926134.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926133.svg'
    ]
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
      flash.now[:alert] = @group.errors.full_messages.first
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:Name, :Icon)
  end
end
