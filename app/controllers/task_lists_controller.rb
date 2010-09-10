class TaskListsController < ApplicationController
  # GET /task_lists
  # GET /task_lists.xml
  def index
    load_user
    @task_lists = TaskList.assigned_to_user(@user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @task_lists }
    end
  end

  # GET /task_lists/1
  # GET /task_lists/1.xml
  def show
    @task_list = TaskList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task_list }
    end
  end

  # GET /task_lists/new
  # GET /task_lists/new.xml
  def new
    @task_list = TaskList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task_list }
    end
  end

  # GET /task_lists/1/edit
  def edit
    @task_list = TaskList.find(params[:id])
  end

  # POST /task_lists
  # POST /task_lists.xml
  def create
    @task_list = TaskList.new(params[:task_list])
    @task_list.user_id = params[:user_id].to_i
    respond_to do |format|
      if @task_list.save
        format.html { redirect_to(user_task_lists_path(@user), :notice => 'TaskList was successfully created.') }
        format.xml  { render :xml => user_task_list(@user), :status => :created, :location => user_task_list(@user) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_lists/1
  # PUT /task_lists/1.xml
  def update
    @task_list = TaskList.find(params[:id])

    respond_to do |format|
      if @task_list.update_attributes(params[:task_list])
        format.html { redirect_to(user_task_lists_path(@task_list.user), :notice => 'TaskList was successfully updated.') }
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
    @task_list = TaskList.find(params[:id])
    @task_list.destroy

    respond_to do |format|
      format.html { redirect_to(user_task_lists_path(@user)) }
      format.xml  { head :ok }
    end
  end
  
  private 
  def load_user
    @user = User.find(params[:user_id].to_i)
  end
end
