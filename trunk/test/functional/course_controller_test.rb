require File.dirname(__FILE__) + '/../test_helper'
require 'course_controller'

# Re-raise errors caught by the controller.
class CourseController; def rescue_action(e) raise e end; end

class CourseControllerTest < Test::Unit::TestCase
  fixtures :courses

  def setup
    @controller = CourseController.new
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

    assert_not_nil assigns(:courses)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:course)
    assert assigns(:course).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:course)
  end

  def test_create
    num_courses = Course.count

    post :create, :course => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_courses + 1, Course.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:course)
    assert assigns(:course).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Course.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Course.find(1)
    }
  end
end
