class Task < ApplicationRecord
  belongs_to :user
  validate :title, presence: true

  def new
    @user = User.find(params[:user_id])
    @task = @user.tasks.build
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.build(task_params)
  end

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
