class Mission::MissionsController < Mission::Controller
  def my_missions
    @missions = current_user.missions unless current_user.nil?
  end

  def mission_board
    @missions = Mission.order(created_at: :desc).where(user_id:
      [current_user] + current_user.friends)
    render 'mission/mission_board'
  end

  def new
  end

  def edit
  end

  def create
    @mission.user = current_user
    if @mission.save
      redirect_to @mission, success: '任务创建成功'
    else
      render 'new'
    end
  end

  def update
    if @mission.update(mission_params)
      redirect_to @mission
    else
      render 'edit'
    end
  end

  def destroy
    @mission.destroy

    redirect_to :my_missions
  end

  def show
  end

  private

  def mission_params
    params.require(:mission).permit(:target, :description, :deadline)
  end
end
