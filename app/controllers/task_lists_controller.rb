class TaskListsController < ApplicationController
  # GET /task_lists
  # GET /task_lists.xml
  def index
    @page_title = "Task Lists"
    @task_lists = TaskList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @task_lists }
    end
  end

  # GET /task_lists/1
  # GET /task_lists/1.xml
  def show
    @page_title = "Task List"
    @task_list = TaskList.find(params[:id])
    @tasks = Task.find(:all,
                      :conditions => ["task_list_id = ?",@task_list.id]
                      ) 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task_list }
    end
  end

  # GET /task_lists/new
  # GET /task_lists/new.xml
  def new
    @page_title = "Task List New"
    @task_list = TaskList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task_list }
    end
  end

  # GET /task_lists/1/edit
  def edit
    @page_title = "Task List Edit"
    @task_list = TaskList.find(params[:id])
  end

  # POST /task_lists
  # POST /task_lists.xml
  def create
    @page_title = "Task List Create"
    @task_list = TaskList.new(params[:task_list])

    respond_to do |format|
      if @task_list.save
        flash[:notice] = 'TaskList was successfully created.'
        format.html { redirect_to(@task_list) }
        format.xml  { render :xml => @task_list, :status => :created, :location => @task_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_lists/1
  # PUT /task_lists/1.xml
  def update
    @page_title = "Task List Update"
    @task_list = TaskList.find(params[:id])

    respond_to do |format|
      if @task_list.update_attributes(params[:task_list])
        flash[:notice] = 'TaskList was successfully updated.'
        format.html { redirect_to(@task_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.xml
  def destroy
    @page_title = "Task List Delete"
    @task_list = TaskList.find(params[:id])
    @task_list.destroy

    respond_to do |format|
      format.html { redirect_to(task_lists_url) }
      format.xml  { head :ok }
    end
  end
  
  # To assing task list to users
  def assign_task_list
    @user = User.find(params[:user_id])
    params[:task_list].split(",").each do |task_list|
      @assign_task = TaskListManagement.assign_task_list(@user.id,task_list)
    end
    redirect_to(@user)
  end
end
