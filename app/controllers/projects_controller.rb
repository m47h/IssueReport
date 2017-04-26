class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = policy_scope(Project)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @issues = @project.issues
  end

  # GET /projects/new
  def new
    @project = Project.new
    authorize @project
  end

  # GET /projects/1/edit
  def edit
    render :new
  end

  # POST /projects
  def create
    authorize complete, :create?
    respond_to do |format|
      if @project.save
        flash[:success] = 'Project was successfully created.'
        format.js { render :create }
      else
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  def update
    respond_to do |format|
      if @project.update(project_params)
        flash[:success] = 'Project was successfully updated.'
        format.js { render :create }
      else
        format.js { render :new }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def complete
    @project = Project.new(project_params) { |p| p.user = current_user }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name)
  end
end
