class   TasksController < ApplicationController
    def index
       
    end 

    def new
        redirect_if_not_logged_in
        redirect_if_not_tasker
        @task = Task.new
     
    end

    def create
        redirect_if_not_logged_in
        redirect_if_not_tasker
       
        #@project = current_user.projects.new(project_params)
        @task = current_user.tasks.new(task_params) ## currently looks for only user:id needs to find project:id, call on current_user is incorrect
        #@task = Task.new(task_params)
       
        if @task.save
            flash[:notice] = "Task Created Successfully!"
            redirect_to '/projects/:id'
        else
            render :new
        end
    end

    private 

    def task_params
        params.require(:task).permit(:objective, :complete)
    end


end