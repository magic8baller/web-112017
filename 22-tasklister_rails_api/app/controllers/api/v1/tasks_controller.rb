class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    render json: @tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    render json: @task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: '200'
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # TODO: Try to rewrite the update and destroy tasks below to render serialized json for updated tasks
  # def update
  #   respond_to do |format|
  #     if @task.update(task_params)
  #       format.html { redirect_to @task, notice: 'Task was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @task }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  # def destroy
  #   @task.destroy
  #   respond_to do |format|
  #     format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :priority, :list_id)
    end
end
