class PaperController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @paper_pages, @papers = paginate :papers, :per_page => 10
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(params[:paper])
    if @paper.save
      flash[:notice] = 'Paper was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def update
    @paper = Paper.find(params[:id])
    if @paper.update_attributes(params[:paper])
      flash[:notice] = 'Paper was successfully updated.'
      redirect_to :action => 'show', :id => @paper
    else
      render :action => 'edit'
    end
  end

  def destroy
    Paper.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
