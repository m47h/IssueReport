class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
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
  end

  # GET /issues/1/edit
  def edit
    render :new
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        flash[:success] = 'Issue was successfully created.'
        format.json { render :show, status: :created, location: @issue }
        format.js   { render :create }
      else
        format.json { render json: @issue.errors, status: :unprocessable_entity }
        format.js   { render :new }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        flash[:success] = 'Issue was successfully updated.'
        format.json { render :show, status: :ok, location: @issue }
        format.js   { render :create }
      else
        format.json { render json: @issue.errors, status: :unprocessable_entity }
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
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:name, :body, :status, :priority)
  end
end
