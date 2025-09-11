class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    # projects/1
    # params = { "id" => "1" }
    # params[:id]
    @project = Project.find(params[:id])
  end

  def new
    @project =  Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project created successfully!"
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # store specific project in an instance veriable so we can display it
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project updated successfully!"
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
    flash[:notice] = "Project deleted."
    redirect_to projects_path
  end

  # Strong Parameters (The New Way)
  def project_params
    params.expect(project: [ :name ])
  end

  # Strong Parameters (The Old Way)
  # def project_params
  #   params.require(:project).permit(:name)
  # end
end
