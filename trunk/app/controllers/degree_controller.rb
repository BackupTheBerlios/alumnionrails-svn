class DegreeController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @degree_pages, @degrees = paginate :degrees, :per_page => 10
  end

  def show
    @degree = Degree.find(params[:id])
  end

  def new
    @degree = Degree.new
  end

  def create
    @degree = Degree.new(params[:degree])
    if @degree.save
      flash[:notice] = 'Degree was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @degree = Degree.find(params[:id])
  end

  def update
    @degree = Degree.find(params[:id])
    if @degree.update_attributes(params[:degree])
      flash[:notice] = 'Degree was successfully updated.'
      redirect_to :action => 'show', :id => @degree
    else
      render :action => 'edit'
    end
  end

  def destroy
    Degree.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
