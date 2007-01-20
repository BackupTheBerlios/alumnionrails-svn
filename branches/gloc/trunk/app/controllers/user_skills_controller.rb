class UserSkillsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @user_skill_pages, @user_skills = paginate :user_skills, :per_page => 10
  end

  def show
    @user_skill = UserSkill.find(params[:id])
  end

  def new
    @user_skill = UserSkill.new
  end

  def create
    @user_skill = UserSkill.new(params[:user_skill])
    if @user_skill.save
      flash[:notice] = 'UserSkill was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @user_skill = UserSkill.find(params[:id])
  end

  def update
    @user_skill = UserSkill.find(params[:id])
    if @user_skill.update_attributes(params[:user_skill])
      flash[:notice] = 'UserSkill was successfully updated.'
      redirect_to :action => 'show', :id => @user_skill
    else
      render :action => 'edit'
    end
  end

  def destroy
    UserSkill.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
