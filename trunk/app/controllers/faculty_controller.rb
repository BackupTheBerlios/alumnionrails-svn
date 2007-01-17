class FacultyController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @faculty_pages, @faculties = paginate :faculties, :per_page => 10
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def new
    @faculty = Faculty.new
  end

  def create
    @faculty = Faculty.new(params[:faculty])
    if @faculty.save
      flash[:notice] = 'Faculty was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update_attributes(params[:faculty])
      flash[:notice] = 'Faculty was successfully updated.'
      redirect_to :action => 'show', :id => @faculty
    else
      render :action => 'edit'
    end
  end

  def destroy
    Faculty.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
