class TrainingController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @training_pages, @trainings = paginate :trainings, :per_page => 10
  end

  def show
    @training = Training.find(params[:id])
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(params[:training])
    if @training.save
      flash[:notice] = 'Training was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    if @training.update_attributes(params[:training])
      flash[:notice] = 'Training was successfully updated.'
      redirect_to :action => 'show', :id => @training
    else
      render :action => 'edit'
    end
  end

  def destroy
    Training.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
