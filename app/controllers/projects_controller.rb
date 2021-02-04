class ProjectsController < ApplicationController

    def index
        redirect_to '/projects/index'
    end 

    def new
        redirect_if_not_logged_in
        redirect_if_not_tasker
        @project = Project.new
    end

    def create
        
        @project = current_user.projects.new(project_params)
        
        if @project.save
            redirect_to '/projects/home'
        else
            flash[:notice] = "Project failed to save. Ensure all fields are filled."
            render :new
        end
    end


    def show
        @project = Project.all
        @projects = Project.find_by(id: params[:id])
        
    end 

    def high_priority
        @high_priority_projects = Project.high_priority
    end
    private 

    def project_params
        params.require(:project).permit(:priority, :description, :title, :user_id)
    end

end