class Supervision::SupervisionsController < Supervision::Controller
  def create
    @supervision.assign_attributes(mission: Mission.find(params[:mission_id]),
       supervisor: current_user);
    if @supervision.save
      redirect_to mission_path(params[:mission_id]), success: '成功发送申请'
    else
      redirect_to mission_path(params[:mission_id]), alert: '申请失败'
    end
  end

end
