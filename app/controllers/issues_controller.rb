class IssuesController < ApplicationController
  before_action :set_project, only: [:index, :create, :new]
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = @project.issues.all
  end

  def search
    @issues = Issue.navbar_search(params[:project_id], params[:search])
    render :index
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @comments = @issue.comments
    @comment = Comment.new
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    authorize @issue
  end

  # GET /issues/1/edit
  def edit
    render :new
  end

  # POST /issues
  def create
    authorize complete, :create?
    respond_to do |format|
      if @issue.save
        flash[:success] = 'Issue was successfully created.'
        format.js   { render :create }
      else
        format.js   { render :new }
      end
    end
  end

  # PATCH/PUT /issues/1
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        flash[:success] = 'Issue was successfully updated.'
        format.js   { render :create }
      else
        format.js   { render :new }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    flash[:danger] = 'Issue was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to [@issue.project] }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
    @project = @issue.project
    authorize @project
  end

  def complete
    @issue = Issue.new(issue_params) do |i|
      i.user = current_user
      i.project = @project
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:name, :body, :status, :priority, :image)
  end
end
