class Mission::CommentsController < Mission::Controller
  load_and_authorize_resource :supervision, class: Mission::Supervision.name, through: :mission,
                              except: :create
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to :back, success: '留言创建成功'
    else
      render plain: @comment.errors.full_messages
      # redirect_to :back, failure: '留言创建失败'
    end
    # render plain: comment_params
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :content)
  end
end