require File.dirname(__FILE__) + '/../test_helper'
require 'user_skills_controller'

# Re-raise errors caught by the controller.
class UserSkillsController; def rescue_action(e) raise e end; end

class UserSkillsControllerTest < Test::Unit::TestCase
  fixtures :user_skills

  def setup
    @controller = UserSkillsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:user_skills)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:user_skill)
    assert assigns(:user_skill).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:user_skill)
  end

  def test_create
    num_user_skills = UserSkill.count

    post :create, :user_skill => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_user_skills + 1, UserSkill.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:user_skill)
    assert assigns(:user_skill).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil UserSkill.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      UserSkill.find(1)
    }
  end
end
