class BugsController < ApplicationController
  before_action :set_options

  # GET /bugs
  # GET /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
    @bug = Bug.find(params[:id])
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = Bug.new(bug_params)

    if @bug.save
      redirect_to @bug
    else
      render 'new'
    end
  end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    @bug = Bug.find(params[:id])
    
    if @bug.update(bug_params)
      redirect_to @bug
    else
      render 'edit'
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    redirect_to bugs_url
  end

  def set_options
    @issue_types = Bug.issue_types
    @priorities = Bug.priorities
    @statuses = Bug.statuses
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:title, :description, :issue_type, :priority, :status)
    end
end
