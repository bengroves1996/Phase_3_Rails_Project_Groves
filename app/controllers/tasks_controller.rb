class   TasksController < ApplicationController
    def index
        @task = Task.all
        
    end 

    def new
        redirect_if_not_logged_in
        redirect_if_not_tasker
        @task = Project.new.tasks.new
    end

    def create

        redirect_if_not_logged_in
        redirect_if_not_tasker
        @task = current_user.projects.all[(params['id'].to_i - 1)].tasks.new(task_params)
        @task.user_id = current_user.id
        if @task.save
            flash[:notice] = "Task Created Successfully!"
            redirect_to '/projects'
        else
            flash[:notice] = "Task did not Save!"
            redirect_to '/projects/:id'
        end
    end

    private 

    def task_params
        params.require(:task).permit(:objective, :complete, :user_id, :project_id)
    end


end