require File.dirname(__FILE__) + '/../test_helper'
require 'degree_controller'

# Re-raise errors caught by the controller.
class DegreeController; def rescue_action(e) raise e end; end

class DegreeControllerTest < Test::Unit::TestCase
  fixtures :degrees

  def setup
    @controller = DegreeController.new
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

    assert_not_nil assigns(:degrees)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:degree)
    assert assigns(:degree).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:degree)
  end

  def test_create
    num_degrees = Degree.count

    post :create, :degree => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_degrees + 1, Degree.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:degree)
    assert assigns(:degree).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Degree.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Degree.find(1)
    }
  end
end
